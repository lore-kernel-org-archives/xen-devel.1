From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/3] x86/svm: Drop enum instruction_index
 and simplify svm_get_insn_len()
Date: Mon, 31 Dec 2018 11:57:17 +0000
Message-ID: <0462ac3d-7027-2fc8-272b-5d360018fa8a@citrix.com>
References: <1546256270-11734-1-git-send-email-andrew.cooper3@citrix.com>
 <1546256270-11734-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2284921090493191359=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1546256270-11734-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============2284921090493191359==
Content-Type: multipart/alternative;
	boundary="------------9CD0DCA024277FF228A1592D"
Content-Language: en-GB

--------------9CD0DCA024277FF228A1592D
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 31/12/2018 11:37, Andrew Cooper wrote:
> +/*
> + * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
> + * opcode, shifted left to make room for the ModRM byte.
> + */
> +#define INSTR_ENC(opc, modrm) (((unsigned int)(opc) << 8) | (modrm))
> +#define MODRM(mod, reg, rm) (((mod) << 6) | ((reg) << 3) | rm)
> +
> +#define INSTR_PAUSE       INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
> +#define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
> +#define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
> +#define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
> +#define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 2, 1))
> +#define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 0))
> +#define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 1))
> +#define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 2))
> +#define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 3))
> +#define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 4))
> +#define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 5))
> +#define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 7))
> +#define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 7, 1))

I'm still tempted to drop the MODRM() macro, and use octal notation

#define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
#define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
#define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
#define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
#define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
#define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
#define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
#define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
#define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)

Seeing as this is a far more logical way to read x86 instructions.

~Andrew

--------------9CD0DCA024277FF228A1592D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 31/12/2018 11:37, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1546256270-11734-3-git-send-email-andrew.cooper3@citrix.com">
      <pre class="moz-quote-pre" wrap="">+/*
+ * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
+ * opcode, shifted left to make room for the ModRM byte.
+ */
+#define INSTR_ENC(opc, modrm) (((unsigned int)(opc) &lt;&lt; 8) | (modrm))
+#define MODRM(mod, reg, rm) (((mod) &lt;&lt; 6) | ((reg) &lt;&lt; 3) | rm)
+
+#define INSTR_PAUSE       INSTR_ENC(X86EMUL_OPC_F3(0, 0x90), 0)
+#define INSTR_INT3        INSTR_ENC(X86EMUL_OPC(   0, 0xcc), 0)
+#define INSTR_ICEBP       INSTR_ENC(X86EMUL_OPC(   0, 0xf1), 0)
+#define INSTR_HLT         INSTR_ENC(X86EMUL_OPC(   0, 0xf4), 0)
+#define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 2, 1))
+#define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 0))
+#define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 1))
+#define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 2))
+#define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 3))
+#define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 4))
+#define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 5))
+#define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 3, 7))
+#define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), MODRM(3, 7, 1))</pre>
    </blockquote>
    <br>
    I'm still tempted to drop the MODRM() macro, and use octal notation<br>
    <br>
    <pre>#define INSTR_XSETBV      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
#define INSTR_VMRUN       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
#define INSTR_VMCALL      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
#define INSTR_VMLOAD      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
#define INSTR_VMSAVE      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
#define INSTR_STGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
#define INSTR_CLGI        INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
#define INSTR_INVLPGA     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
#define INSTR_RDTSCP      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)

</pre>
    Seeing as this is a far more logical way to read x86 instructions.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------9CD0DCA024277FF228A1592D--


--===============2284921090493191359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2284921090493191359==--
