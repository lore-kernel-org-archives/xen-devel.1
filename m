From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH v5 01/10] xen/arm64: Added handling of the
 trapped access to OSLSR register
Date: Thu, 7 Jun 2018 12:54:01 +0200
Message-ID: <CAKPH-NgaaYY5Hy5XxUw7NvPLjVC2_U0CBAOmFOnftcyYZPKFCg@mail.gmail.com>
References: <20180601131750.16598-1-mirela.simonovic@aggios.com>
 <20180601131750.16598-2-mirela.simonovic@aggios.com>
 <1bc4389d-b5f4-6b60-153c-aecb467a4945@arm.com>
 <0ec51436-3d1e-9769-01ac-779dd02ddc63@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6796455488150806516=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0ec51436-3d1e-9769-01ac-779dd02ddc63@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============6796455488150806516==
Content-Type: multipart/alternative; boundary="000000000000e6c789056e0b1935"

--000000000000e6c789056e0b1935
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Tue, Jun 5, 2018 at 8:00 PM, Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 05/06/18 18:24, Julien Grall wrote:
>
>> Hi Mirela,
>>
>> On 01/06/18 14:17, Mirela Simonovic wrote:
>>
>>> Linux/dom0 accesses OSLSR register when saving CPU context during the
>>> suspend procedure. Xen traps access to this register, but has no handling
>>> for it. Consequently, Xen injects undef exception to linux, causing it to
>>> crash. This patch adds handling of the trapped access to OSLSR as read
>>> only as a fixed value.
>>>
>>
>> Can you please mention that you introduced handle_ro_read_val() and
>> rework handle_ro_raz()?
>>
>>
>>> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Acked-by: Julien Grall <julien.grall@arm.com>
>>>
>>
>> The reviewed-by/acked-by tags should only be kept when there are minor
>> changes in the code (and the reviewer is happy with them). This is very
>> important for the former as the tag means the reviewer read your code and
>> confirm this is correct.
>>
>> As you change quite a bit the patch, those 2 tags should have been
>> removed.
>>
>> Stefano, are you still happy with the Reviewed-by?
>>
>
> Stefano mentioned on IRC he was happy with the reviewed-by kept.
>
> I will go ahead with merging the series. For this patch, I will add the
> following in the commit message:
>
> "For convenience, introduce a new helper handle_ro_read_val() based on
> handle_ro_raz() that will return a specified value on read and re-implement
> handle_ro_raz() based on the new helper".
>
>
Great, thanks!


> Cheers,
>
> --
> Julien Grall
>

--000000000000e6c789056e0b1935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Tue, Jun 5, 2018 at 8:00 PM, Julien Grall <span dir=3D"ltr">&l=
t;<a href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@ar=
m.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><br>
<br>
On 05/06/18 18:24, Julien Grall wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Mirela,<br>
<br>
On 01/06/18 14:17, Mirela Simonovic wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Linux/dom0 accesses OSLSR register when saving CPU context during the<br>
suspend procedure. Xen traps access to this register, but has no handling<b=
r>
for it. Consequently, Xen injects undef exception to linux, causing it to<b=
r>
crash. This patch adds handling of the trapped access to OSLSR as read<br>
only as a fixed value.<br>
</blockquote>
<br>
Can you please mention that you introduced handle_ro_read_val() and rework =
handle_ro_raz()?<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Mirela Simonovic &lt;<a href=3D"mailto:mirela.simonovic@aggi=
os.com" target=3D"_blank">mirela.simonovic@aggios.com</a>&gt;<br>
Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
Acked-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" target=
=3D"_blank">julien.grall@arm.com</a>&gt;<br>
</blockquote>
<br>
The reviewed-by/acked-by tags should only be kept when there are minor chan=
ges in the code (and the reviewer is happy with them). This is very importa=
nt for the former as the tag means the reviewer read your code and confirm =
this is correct.<br>
<br>
As you change quite a bit the patch, those 2 tags should have been removed.=
<br>
<br>
Stefano, are you still happy with the Reviewed-by?<br>
</blockquote>
<br></span>
Stefano mentioned on IRC he was happy with the reviewed-by kept.<br>
<br>
I will go ahead with merging the series. For this patch, I will add the fol=
lowing in the commit message:<br>
<br>
&quot;For convenience, introduce a new helper handle_ro_read_val() based on=
 handle_ro_raz() that will return a specified value on read and re-implemen=
t handle_ro_raz() based on the new helper&quot;.<br>
<br></blockquote><div><br></div><div>Great, thanks!</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
Cheers,<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></div><br></div></div>

--000000000000e6c789056e0b1935--


--===============6796455488150806516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6796455488150806516==--
