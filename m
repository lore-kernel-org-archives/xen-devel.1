Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0930C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:40:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401210.1636963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcDb-0000Kh-DD; Thu, 27 Aug 2026 15:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401210.1636963; Thu, 27 Aug 2026 15:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcDb-0000Ka-9F; Thu, 27 Aug 2026 15:40:43 +0000
Received: by outflank-mailman (input) for mailman id 1401210;
 Thu, 27 Aug 2026 15:40:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzcDa-0000KN-99
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:40:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzcDZ-00FkYY-30
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:40:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905a71-bab6-0a2a0a5309dd-0a2a4508b6c6-22
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:40:41 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905a78-f659-0a2a45080019-d1558032ac96-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:40:41 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-495590dde14so21626365e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:40:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27a9945sm9543491f8f.9.2026.08.27.08.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 08:40:40 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787845240; x=1788450040; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzDEVYEo7WZB5nmhHGg2SrGNKjaZ+3k8JrFM6QlK5KU=;
        b=G0yyvNoelk0WKi+m8TZC7dZVd9+JZG0F1wLhpEkD1GQCMf/dtHkiyfBfE5FVkSQcKJ
         LwWpI/JDIhe1nF3SC6zBuXB17X5NX2ubCtrvjAlfLadBuo8huldujdASF24q9/JukqdE
         RXf6XAAAwttWXfnF8QHBDA4r1qtwOteHvAbckwCVfixWKRJEc77BdmIJtKNJ1U+lBCPV
         wvdnOGwyaZEOeXnIam7r5tKiVZ5kLDkgukiacMUHTYTqlNkdDIpslw67+zLS7mt0iVEv
         4jqYCVCIYQozxk6WdX961Cuu5Mi0AF9fYBbUaBUUtT0Xrdj3hW7FslAOtXb/HpT3jq55
         CeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787845240; x=1788450040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzDEVYEo7WZB5nmhHGg2SrGNKjaZ+3k8JrFM6QlK5KU=;
        b=EUfW2Qs705eDtK/z0UHIXtOa7/izzg5tFiY64NbUF563OjG1pEt9i2PFFudgQ/ijdB
         L0+gu6rWh+IlWk9BpY3h0YSmYMLSv7LZIanL0pKWYSj/VSI2O7MSp/1JOGAfn71vKtrT
         ySf+ansuMNfNIKLpl+3zyuBqdVoqD/l1z3oHI64nWGBSSthBvuCT+uZk6cE+uZqx6MF2
         jPzBaFn+Dv4s44oF1qWwjDFEsy+1DT1hEgqOeWH6MAAD5W4Tkt71pu9EVc954RS9kuju
         xhLMf8w0Iq701OkWU40oa/DvEMOtKMGdly3Ioow/EjeT4hkdg0DQNwGXp5pha9DkShV+
         o/9A==
X-Forwarded-Encrypted: i=1; AHgh+RpHaC+1b4O0J4eqes0Zz5e6SO81S15rkC9xAzmKce2fFTNpixY1gE1TJ18cuqj+ijSBmeWVtCX9MH8=@lists.xenproject.org
X-Gm-Message-State: AFuF++k1AWSreDqleSx2YjsFKTxQ7oyak1wOQY8vZlbbgKSq0vy+QFEy
	Stn1HjcXhpNjSdXrlfwbwM/OBI3S4/Sh09kZ3qGnT8xA8ejKZPvziOSj
X-Gm-Gg: AR+sD11Fj9xuPXnU6SUW8vRXIPCSvA45YurHPxIJFabxvaKrLM00d8u4FbE9w8+ia4g
	2in5sl71y4S4BVoFdnidh5IWo+rxjsSmLHuo/2vV9VZRimk+JYj7ra1jjrJjkp6d1vM10eyinVC
	3bdiQvNYzsZx7RZ8wECu1bpi1v33L+vT4qvroJYpx6snOcIHxjdFgdcKaxCfOWG55G+wyIhurat
	ogZCqzs+hDtOOnuX+AIIvZSs3TjR/2+2NWgLqL+rolkZusTaY9Xzbedw6WsL/XMXvwinQmuQphk
	eXhq6/JdqMDfTyhY9O2OtB5a9U4Fb83pq38MUibKX6Oguy5a/SGcBOUjFtmt0Vxp9/H7m8pPWxY
	IGcXFBl9xPGICoNW8mmXH55Tbzfrcd6z62EFLP0Cd7f7noxfRbM1gLLIJgoFmJZJOarN1HHfcT4
	2jl+eDKxLW02wrE9UqwCRpGstqEfPxIgisDNRe3cQ9OLbNZDXix6tj0qENv9o+EWJjaSmYEEDw3
	RZsfAdFPCc/qdlErY50Duc3Gmh/8ObHD2wbrX3c3O+dx2KFAJCC
X-Received: by 2002:a05:600c:46cc:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b909e92aamr36362385e9.10.1787845240450;
        Thu, 27 Aug 2026 08:40:40 -0700 (PDT)
Message-ID: <0d0c6a5b-94a5-49c6-a150-3bb6a0dc3b93@gmail.com>
Date: Thu, 27 Aug 2026 17:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] RISC-V: place .sdata / .srodata /
 .riscv.attributes
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <f26f80e3-0b2d-429a-895c-b8003d1c5a38@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f26f80e3-0b2d-429a-895c-b8003d1c5a38@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787845241-CDF4787B-D226F3F3/10/73395122804
X-purgate-type: spam
X-purgate-size: 6004



On 8/26/26 2:04 PM, Jan Beulich wrote:
> Of the short-data sections, only .sbss is presently mentioned in the
> linker script. Place them next to, but ahead of their "normal" data
> sections.
> 
> .riscv.attributes can go towards the tail of the image, next to (ahead of)
> debug info.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Seeing where .sbss lives, does positioning really not matter at all? I
> would have expected that short-data sections want to live close together,
> and specifically close to .text / .init.text (seeing that such data is
> accessed using AUIPC). I'm puzzled that the psABI doesn't even mention
> them, hence leaving it open how exactly they are to be used.

It doesn't, and the reason is that the relevant proximity isn't to .text 
but to __global_pointer$. The small-data sections exist to let a linker 
script cluster small objects around that anchor so that ld's relaxation 
pass can fold an auipc+load pair into a single gp-relative access (-+2 
KiB window).

That pass is keyed purely on the symbol being defined 
riscv_global_pointer_value() returns 0 otherwise and the relaxation is 
skipped. We define no __global_pointer$ and head.S never loads gp (it 
appears only as a cpu_user_regs slot in entry.S), so every access stays 
the medany auipc form regardless of section.

I confirmed this by linking the same object twice (look at the script 
below, with and without the symbol: without it, zero gp-relative 
accesses; with it, the pairs collapse.

Worth noting the relaxation is section-agnostic: in the test mentioned 
below a 400-byte array in plain .bss got gp-relative too, purely because 
it landed in range. So the sections are a clustering hint, not a 
mechanism ld keys off.

The script I used:
```
mkdir -p /tmp/gp-demo && cd /tmp/gp-demo

# 1. Test code: one small variable (-> .sbss) and one large array (-> .bss)
cat > s.c <<'EOF'
int small_var;                                  /* 4 bytes   -> .sbss */
int big_arr[100];                               /* 400 bytes -> .bss  */
int read_small(void) { return small_var; }
int read_big(void)   { return big_arr[0]; }
EOF

# 2. Linker script WITHOUT __global_pointer$
cat > nogp.lds <<'EOF'
ENTRY(read_small)
SECTIONS {
   . = 0xffffffffc0000000;
   .text : { *(.text) *(.text.*) }
   .data : { *(.sdata .sdata.*) *(.data .data.*) }
   .bss  : { *(.sbss .sbss.*) *(.bss .bss.*) *(COMMON) }
   /DISCARD/ : { *(.comment) *(.note*) *(.riscv.attributes) }
}
EOF

# 3. Same script, but WITH __global_pointer$ defined
sed 's|^  \.data : {|  __global_pointer$ = . + 0x800;\n  .data : {|' 
nogp.lds > gp.lds

riscv64-linux-gnu-gcc -O2 -march=rv64ima -mabi=lp64 -mcmodel=medany \
                       -ffreestanding -c s.c -o s.o

# Check the INPUT sections: .sbss vs plain .bss (the link merges them, so
# inspect s.o, not the linked ELF)
echo "### INPUT sections the symbols live in ###"
riscv64-linux-gnu-objdump -t s.o | grep -E 'small_var|big_arr'

# Link both ways and compare the generated code
for L in nogp gp; do
   riscv64-linux-gnu-ld -T $L.lds s.o -o $L.elf 2>/dev/null
   echo "=============== $L.lds ==============="
   riscv64-linux-gnu-objdump -d --no-show-raw-insn $L.elf \
     | sed -n '/<read_small>:/,/ret/p;/<read_big>:/,/ret/p'
done

```


> 
> What remains to eliminate orphan section warnings is the placement of
> .note.GNU-stack (which perhaps wants dealing with on all of Arm, PPC, and
> RISC-V together, ideally unifying with x86) and (odd at the first glance,
> but dealt with on x86 as well, i.e. may again want unifying) that of a
> number of .rela.* sections.
> 
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -44,6 +44,8 @@ SECTIONS
>   
>           BUGFRAMES
>   
> +        *(.srodata)
> +        *(.srodata.*)
>           *(.rodata)
>           *(.rodata.*)
>           VPCI_ARRAY
> @@ -92,6 +94,7 @@ SECTIONS
>           SCHEDULER_ARRAY
>           HYPFS_PARAM
>   
> +        *(.sdata .sdata.*)
>           *(.data .data.*)
>           CONSTRUCTORS
>       } :text
> @@ -162,6 +165,8 @@ SECTIONS
>       /* Section for the device tree blob (if any). */
>       .dtb : { *(.dtb) } :text
>   
> +    .riscv.attributes : { *(.riscv.attributes) } :text
> +

Nit: .riscv.attributes is SHT_RISCV_ATTRIBUTES, i.e. non-alloc.
:text on it is misleading, and without an explicit address it gets 
sh_addr from .(location counter) after .dtb. Could we use matching the 
idiom used for every other non-alloc section in xen.lds.h:
   .riscv.attributes 0 : { *(.riscv.attributes) }
No functional difference either way (objcopy -O binary drops it, and I 
verified a non-alloc output section doesn't advance dot, so nothing 
downstream shifts), so purely consistency.

Is dropping orphan-handling-y := from arch/riscv/Makefile the intended 
end of this series? As if I understand correctly with such defintion we 
will miss warning so everything of that will be missed:

cd xen
riscv64-linux-gnu-ld -T arch/riscv/xen.lds prelink.o 
--orphan-handling=warn -o /tmp/t.elf 2>&1 \
   | grep 'orphan section'
/usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.note.GNU-stack' 
from `prelink.o' being placed in section `.note.GNU-stack'
/usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.text' from 
`prelink.o' being placed in section `.rela.dyn'
/usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.init.text' 
from `prelink.o' being placed in section `.rela.dyn'
/usr/bin/riscv64-linux-gnu-ld: warning: orphan section 
`.rela.data.read_mostly' from `prelink.o' being placed in section 
`.rela.dyn'
/usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.init.data' 
from `prelink.o' being placed in section `.rela.dyn'
/usr/bin/riscv64-linux-gnu-ld: warning: orphan section 
`.rela.text.header' from `prelink.o' being placed in section `.rela.dyn'

Thanks.

~ Oleksii

