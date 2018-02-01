From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v2 1/3] xen/arm: io: Distinguish unhandled
 IO from aborted one
Date: Thu, 1 Feb 2018 19:27:32 +0000
Message-ID: <CAEC2CxqaMY7gX6AdezY72phqXQeZ3ytBrUmeTKWZigva2bNzSQ@mail.gmail.com>
References: <20180201184749.29430-1-julien.grall@arm.com>
 <20180201184749.29430-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1802011100230.11958@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6594482138041635819=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1802011100230.11958@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============6594482138041635819==
Content-Type: multipart/alternative; boundary="001a114a6de86b7c0305642b964e"

--001a114a6de86b7c0305642b964e
Content-Type: text/plain; charset="UTF-8"

(sorry for the formatting)

On 1 Feb 2018 19:05, "Stefano Stabellini" <sstabellini@kernel.org> wrote:

On Thu, 1 Feb 2018, Julien Grall wrote:
> Currently, Xen is considering that an IO could either be handled or
> unhandled. When unhandled, the stage-2 abort function will try another
> way to resolve the abort.
>
> However, the MMIO emulation may return unhandled when the address
> belongs to an emulated range but was not correct. In that case, Xen
> should avoid to try another way and directly inject a guest data abort.
>
> Introduce a tri-state return to distinguish the following state:
>     * IO_ABORT: The IO was handled but resulted in an abort
>     * IO_HANDLED: The IO was handled
>     * IO_UNHANDLED: The IO was unhandled
>
> For now, it is considered that an IO belonging to an emulated range
> could either be handled or inject an abort. This could be revisit in the
> future if overlapped region exist (or we want to try another way to
> resolve the abort).
>
> Signed-off-by: Julien Grall <julien.grall@arm.com>
>
> ---
>     Changes in v2:
>         - Always return IO_ABORT when the check failed because we know
>         it was targeted emulated IO.
>         - Fix typoes
> ---
>  xen/arch/arm/io.c          | 32 ++++++++++++++++++--------------
>  xen/arch/arm/traps.c       | 18 +++++++++++++++---
>  xen/include/asm-arm/mmio.h | 13 ++++++++++---
>  3 files changed, 43 insertions(+), 20 deletions(-)
>
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index c3e9239ffe..1f4cb8f37d 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -26,8 +26,9 @@
>
>  #include "decode.h"
>
> -static int handle_read(const struct mmio_handler *handler, struct vcpu
*v,
> -                       mmio_info_t *info)
> +static enum io_state handle_read(const struct mmio_handler *handler,
> +                                 struct vcpu *v,
> +                                 mmio_info_t *info)
>  {
>      const struct hsr_dabt dabt = info->dabt;
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
> @@ -40,7 +41,7 @@ static int handle_read(const struct mmio_handler
*handler, struct vcpu *v,
>      uint8_t size = (1 << dabt.size) * 8;
>
>      if ( !handler->ops->read(v, info, &r, handler->priv) )
> -        return 0;
> +        return IO_ABORT;
>
>      /*
>       * Sign extend if required.
> @@ -60,17 +61,20 @@ static int handle_read(const struct mmio_handler
*handler, struct vcpu *v,
>
>      set_user_reg(regs, dabt.reg, r);
>
> -    return 1;
> +    return IO_HANDLED;
>  }
>
> -static int handle_write(const struct mmio_handler *handler, struct vcpu
*v,
> -                        mmio_info_t *info)
> +static enum io_state handle_write(const struct mmio_handler *handler,
> +                                  struct vcpu *v,
> +                                  mmio_info_t *info)
>  {
>      const struct hsr_dabt dabt = info->dabt;
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    int ret;
>
> -    return handler->ops->write(v, info, get_user_reg(regs, dabt.reg),
> -                               handler->priv);
> +    ret = handler->ops->write(v, info, get_user_reg(regs, dabt.reg),
> +                              handler->priv);
> +    return ( ret ) ? IO_HANDLED : IO_ABORT;
>  }
>
>  /* This function assumes that mmio regions are not overlapped */
> @@ -103,9 +107,9 @@ static const struct mmio_handler
*find_mmio_handler(struct domain *d,
>      return handler;
>  }
>
> -int try_handle_mmio(struct cpu_user_regs *regs,
> -                    const union hsr hsr,
> -                    paddr_t gpa)
> +enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> +                              const union hsr hsr,
> +                              paddr_t gpa)
>  {
>      struct vcpu *v = current;
>      const struct mmio_handler *handler = NULL;
> @@ -119,11 +123,11 @@ int try_handle_mmio(struct cpu_user_regs *regs,
>
>      handler = find_mmio_handler(v->domain, info.gpa);
>      if ( !handler )
> -        return 0;
> +        return IO_UNHANDLED;

Did you forget to send a patch? Or is there a prerequisite for this
series? This patch doesn't apply.


Yes, I messed up my git format-patch command line.
The series is meant to have 4 patches.

Sorry for that. I will resend it tomorrow.

Cheers,



>      /* All the instructions used on emulated MMIO region should be valid
*/
>      if ( !dabt.valid )
> -        return 0;
> +        return IO_ABORT;
>
>      /*
>       * Erratum 766422: Thumb store translation fault to Hypervisor may
> @@ -138,7 +142,7 @@ int try_handle_mmio(struct cpu_user_regs *regs,
>          if ( rc )
>          {
>              gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> -            return 0;
> +            return IO_ABORT;
>          }
>      }
>
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 2f8d790bb3..1e85f99ec1 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1964,10 +1964,21 @@ static void do_trap_stage2_abort_guest(struct
cpu_user_regs *regs,
>           *
>           * Note that emulated region cannot be executed
>           */
> -        if ( is_data && try_handle_mmio(regs, hsr, gpa) )
> +        if ( is_data )
>          {
> -            advance_pc(regs, hsr);
> -            return;
> +            enum io_state state = try_handle_mmio(regs, hsr, gpa);
> +
> +            switch ( state )
> +            {
> +            case IO_ABORT:
> +                goto inject_abt;
> +            case IO_HANDLED:
> +                advance_pc(regs, hsr);
> +                return;
> +            case IO_UNHANDLED:
> +                /* IO unhandled, try another way to handle it. */
> +                break;
> +            }
>          }
>
>          /*
> @@ -1988,6 +1999,7 @@ static void do_trap_stage2_abort_guest(struct
cpu_user_regs *regs,
>                  hsr.bits, xabt.fsc);
>      }
>
> +inject_abt:
>      gdprintk(XENLOG_DEBUG, "HSR=0x%x pc=%#"PRIregister" gva=%#"PRIvaddr
>               " gpa=%#"PRIpaddr"\n", hsr.bits, regs->pc, gva, gpa);
>      if ( is_data )
> diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h
> index c941073257..c8dadb5006 100644
> --- a/xen/include/asm-arm/mmio.h
> +++ b/xen/include/asm-arm/mmio.h
> @@ -32,6 +32,13 @@ typedef struct
>      paddr_t gpa;
>  } mmio_info_t;
>
> +enum io_state
> +{
> +    IO_ABORT,       /* The IO was handled by the helper and led to an
abort. */
> +    IO_HANDLED,     /* The IO was successfully handled by the helper. */
> +    IO_UNHANDLED,   /* The IO was not handled by the helper. */
> +};
> +
>  typedef int (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
>                             register_t *r, void *priv);
>  typedef int (*mmio_write_t)(struct vcpu *v, mmio_info_t *info,
> @@ -56,9 +63,9 @@ struct vmmio {
>      struct mmio_handler *handlers;
>  };
>
> -int try_handle_mmio(struct cpu_user_regs *regs,
> -                    const union hsr hsr,
> -                    paddr_t gpa);
> +enum io_state try_handle_mmio(struct cpu_user_regs *regs,
> +                              const union hsr hsr,
> +                              paddr_t gpa);
>  void register_mmio_handler(struct domain *d,
>                             const struct mmio_handler_ops *ops,
>                             paddr_t addr, paddr_t size, void *priv);
> --
> 2.11.0
>

_______________________________________________
Xen-devel mailing list
Xen-devel@lists.xenproject.org
https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a114a6de86b7c0305642b964e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>(sorry for the formatting)<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 1 Feb 2018 19:05, &quot;Stefano Stab=
ellini&quot; &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kern=
el.org</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 class=3D"elided-text">On Thu, 1 Feb 2018, Julien Grall wrote:<br>
&gt; Currently, Xen is considering that an IO could either be handled or<br=
>
&gt; unhandled. When unhandled, the stage-2 abort function will try another=
<br>
&gt; way to resolve the abort.<br>
&gt;<br>
&gt; However, the MMIO emulation may return unhandled when the address<br>
&gt; belongs to an emulated range but was not correct. In that case, Xen<br=
>
&gt; should avoid to try another way and directly inject a guest data abort=
.<br>
&gt;<br>
&gt; Introduce a tri-state return to distinguish the following state:<br>
&gt;=C2=A0 =C2=A0 =C2=A0* IO_ABORT: The IO was handled but resulted in an a=
bort<br>
&gt;=C2=A0 =C2=A0 =C2=A0* IO_HANDLED: The IO was handled<br>
&gt;=C2=A0 =C2=A0 =C2=A0* IO_UNHANDLED: The IO was unhandled<br>
&gt;<br>
&gt; For now, it is considered that an IO belonging to an emulated range<br=
>
&gt; could either be handled or inject an abort. This could be revisit in t=
he<br>
&gt; future if overlapped region exist (or we want to try another way to<br=
>
&gt; resolve the abort).<br>
&gt;<br>
&gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com=
">julien.grall@arm.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0Changes in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Always return IO_ABORT when the che=
ck failed because we know<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it was targeted emulated IO.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Fix typoes<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/io.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 +++++++=
+++++++++++------------<wbr>--<br>
&gt;=C2=A0 xen/arch/arm/traps.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++=
+++---<br>
&gt;=C2=A0 xen/include/asm-arm/mmio.h | 13 ++++++++++---<br>
&gt;=C2=A0 3 files changed, 43 insertions(+), 20 deletions(-)<br>
&gt;<br>
&gt; diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c<br>
&gt; index c3e9239ffe..1f4cb8f37d 100644<br>
&gt; --- a/xen/arch/arm/io.c<br>
&gt; +++ b/xen/arch/arm/io.c<br>
&gt; @@ -26,8 +26,9 @@<br>
&gt;<br>
&gt;=C2=A0 #include &quot;decode.h&quot;<br>
&gt;<br>
&gt; -static int handle_read(const struct mmio_handler *handler, struct vcp=
u *v,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mmio_info_t *info)<br>
&gt; +static enum io_state handle_read(const struct mmio_handler *handler,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vcpu *v,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio_info_t *info)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const struct hsr_dabt dabt =3D info-&gt;dabt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct cpu_user_regs *regs =3D guest_cpu_user_regs=
();<br>
&gt; @@ -40,7 +41,7 @@ static int handle_read(const struct mmio_handler *ha=
ndler, struct vcpu *v,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t size =3D (1 &lt;&lt; dabt.size) * 8;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( !handler-&gt;ops-&gt;read(v, info, &amp;r, ha=
ndler-&gt;priv) )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_ABORT;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Sign extend if required.<br>
&gt; @@ -60,17 +61,20 @@ static int handle_read(const struct mmio_handler *=
handler, struct vcpu *v,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_user_reg(regs, dabt.reg, r);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 return 1;<br>
&gt; +=C2=A0 =C2=A0 return IO_HANDLED;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static int handle_write(const struct mmio_handler *handler, struct vc=
pu *v,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 mmio_info_t *info)<br>
&gt; +static enum io_state handle_write(const struct mmio_handler *handler,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vcpu *v,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmio_info_t *info)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const struct hsr_dabt dabt =3D info-&gt;dabt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct cpu_user_regs *regs =3D guest_cpu_user_regs=
();<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 return handler-&gt;ops-&gt;write(v, info, get_user_reg(=
regs, dabt.reg),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handler-&gt;priv);<br>
&gt; +=C2=A0 =C2=A0 ret =3D handler-&gt;ops-&gt;write(v, info, get_user_reg=
(regs, dabt.reg),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handler-&gt;priv);<br>
&gt; +=C2=A0 =C2=A0 return ( ret ) ? IO_HANDLED : IO_ABORT;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 /* This function assumes that mmio regions are not overlapped */=
<br>
&gt; @@ -103,9 +107,9 @@ static const struct mmio_handler *find_mmio_handle=
r(struct domain *d,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return handler;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -int try_handle_mmio(struct cpu_user_regs *regs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 const union hsr hsr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 paddr_t gpa)<br>
&gt; +enum io_state try_handle_mmio(struct cpu_user_regs *regs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const union hsr hsr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paddr_t gpa)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct vcpu *v =3D current;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const struct mmio_handler *handler =3D NULL;<br>
&gt; @@ -119,11 +123,11 @@ int try_handle_mmio(struct cpu_user_regs *regs,<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 handler =3D find_mmio_handler(v-&gt;domain, info.g=
pa);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( !handler )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_UNHANDLED;<br>
<br>
</div>Did you forget to send a patch? Or is there a prerequisite for this<b=
r>
series? This patch doesn&#39;t apply.<br></blockquote></div></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Yes, I messed up my git format-p=
atch command line.</div><div dir=3D"auto">The series is meant to have 4 pat=
ches.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry for that. I =
will resend it tomorrow.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"elided-text"><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* All the instructions used on emulated MMIO regi=
on should be valid */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( !dabt.valid )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_ABORT;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Erratum 766422: Thumb store translation fa=
ult to Hypervisor may<br>
&gt; @@ -138,7 +142,7 @@ int try_handle_mmio(struct cpu_user_regs *regs,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gprintk(XENLOG_DEBUG, =
&quot;Unable to decode instruction\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_ABORT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c<br>
&gt; index 2f8d790bb3..1e85f99ec1 100644<br>
&gt; --- a/xen/arch/arm/traps.c<br>
&gt; +++ b/xen/arch/arm/traps.c<br>
&gt; @@ -1964,10 +1964,21 @@ static void do_trap_stage2_abort_guest(<wbr>st=
ruct cpu_user_regs *regs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that emulated region ca=
nnot be executed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( is_data &amp;&amp; try_handle_mmio(r=
egs, hsr, gpa) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( is_data )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 advance_pc(regs, hsr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum io_state state =3D try=
_handle_mmio(regs, hsr, gpa);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch ( state )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case IO_ABORT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto inject_a=
bt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case IO_HANDLED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 advance_pc(re=
gs, hsr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case IO_UNHANDLED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IO unhandl=
ed, try another way to handle it. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; @@ -1988,6 +1999,7 @@ static void do_trap_stage2_abort_guest(<wbr>stru=
ct cpu_user_regs *regs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsr.bits=
, xabt.fsc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; +inject_abt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdprintk(XENLOG_DEBUG, &quot;HSR=3D0x%x pc=3D%#&qu=
ot;PRIregister&quot; gva=3D%#&quot;PRIvaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; gpa=3D%#&=
quot;PRIpaddr&quot;\n&quot;, hsr.bits, regs-&gt;pc, gva, gpa);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( is_data )<br>
&gt; diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h<b=
r>
&gt; index c941073257..c8dadb5006 100644<br>
&gt; --- a/xen/include/asm-arm/mmio.h<br>
&gt; +++ b/xen/include/asm-arm/mmio.h<br>
&gt; @@ -32,6 +32,13 @@ typedef struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 paddr_t gpa;<br>
&gt;=C2=A0 } mmio_info_t;<br>
&gt;<br>
&gt; +enum io_state<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 IO_ABORT,=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The IO was handl=
ed by the helper and led to an abort. */<br>
&gt; +=C2=A0 =C2=A0 IO_HANDLED,=C2=A0 =C2=A0 =C2=A0/* The IO was successful=
ly handled by the helper. */<br>
&gt; +=C2=A0 =C2=A0 IO_UNHANDLED,=C2=A0 =C2=A0/* The IO was not handled by =
the helper. */<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 typedef int (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0register_t *r, void *priv);<br>
&gt;=C2=A0 typedef int (*mmio_write_t)(struct vcpu *v, mmio_info_t *info,<b=
r>
&gt; @@ -56,9 +63,9 @@ struct vmmio {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct mmio_handler *handlers;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -int try_handle_mmio(struct cpu_user_regs *regs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 const union hsr hsr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 paddr_t gpa);<br>
&gt; +enum io_state try_handle_mmio(struct cpu_user_regs *regs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const union hsr hsr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paddr_t gpa);<br>
&gt;=C2=A0 void register_mmio_handler(struct domain *d,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct mmio_handler_ops *ops,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0paddr_t addr, paddr_t size, void *priv);<=
br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
<br>
______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-devel</a></div></blockquote></div><br></div></div></div>

--001a114a6de86b7c0305642b964e--


--===============6594482138041635819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6594482138041635819==--
