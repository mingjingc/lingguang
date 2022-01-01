<template>
  <div class="bg-page-bg-editor h-screen">
    <div class="w-full sm:w-1200 mx-auto">
      <VueEditor :editor="editor" />
    </div>
  </div>
</template>

<script setup>
import { defaultValueCtx, Editor, editorViewOptionsCtx, rootCtx } from "@milkdown/core";
import { emoji } from "@milkdown/plugin-emoji";
import { listener, listenerCtx } from '@milkdown/plugin-listener';
import { menu } from '@milkdown/plugin-menu';
import { slash } from '@milkdown/plugin-slash';
import { commonmark } from "@milkdown/preset-commonmark";
import { nord } from "@milkdown/theme-nord";
import { useEditor, VueEditor } from "@milkdown/vue";

let jsonOutput = {
    "type": "doc",
    "content": [
        {
            "type": "heading",
            "attrs": {
                "level": 1,
                "id": ""
            },
            "content": [
                {
                    "type": "text",
                    "text": "第一章"
                }
            ]
        },
        {
            "type": "paragraph",
            "content": [
                {
                    "type": "text",
                    "text": "春秋战国时期，各方谋士纷纷投奔有权势的大贵族、大财主，更有门路的找到诸侯，说“我知道你想达到的目标，也知道你空有粮草、兵力不知如何调用，现在我这儿有个好主意愿意献给你”。如果谋士能说服大王，那大王手里的资源就归他调遣，谋士也就可以出将入相，身居高位。今天的金融家，比较了不起的比如索罗斯，他也想干这种事，那他就是说客。当然，他得先有点战绩或者学问，不然大王没理由信他。还有一种人，本事没那么大，他们干吗呢？就是给人牵线搭桥当媒婆。有的媒婆很聪明，找的人家门当户对；有的就坑蒙拐骗，指着从里面收佣金。现在金融市场上一大批所谓帮人理财的人，干的其实就是媒婆的买卖。"
                }
            ]
        },
        {
            "type": "blockquote",
            "content": [
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "type": "text",
                            "text": "耶鲁大学陈志武教授有本书叫《金融的逻辑》，里面讲金融的本质是“跨越时间和空间的交易”。可惜的是，他没有说明未来的资产交易如何定价，也没说不同游戏规则下的交易结果是否稳定和合理。更基本的问题是，逻辑的本质是一种符号语言，但不是科学，因为科学需要经验验证和理论自洽。中国的读者，如果有学术批判能力，就不难从陈志武的金融逻辑出发，发现西方新自由主义经济学的本质是空想资本主义，金融衍生品更是金融战的工具，而非共同富裕的市场。"
                        }
                    ]
                }
            ]
        }
    ]
}
const myListener = {
    doc: [
        (node) => {
          console.log('node:', node.toJSON())
          jsonOutput = node.toJSON();
        },
    ],
};
const defaultValue = {
  type: 'json',
  value: jsonOutput,
};

let readonly = true;

const editable = () => !readonly;

const editor = useEditor((root) =>
  Editor.make()
    .config((ctx) => {
      ctx.set(rootCtx, root);
      ctx.set(listenerCtx, myListener);
      ctx.set(defaultValueCtx, defaultValue);
      ctx.set(editorViewOptionsCtx, { editable });
    })
    .use(nord)
    .use(listener)
    .use(emoji)
    .use(slash)
    .use(menu)
    .use(commonmark)
);
</script>
<style>
/* @media only screen and (min-width: 72rem) { */
  .milkdown {
    height: 100vh;
    overflow: auto;
  }
  @media only screen and (min-width: 72rem) {
    .milkdown .editor {
        max-width: 80rem;
        padding: 3.125rem 7.25rem;
    }
  }
/* } */
</style>