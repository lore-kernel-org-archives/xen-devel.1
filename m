From: Stefan Bader <stefan.bader@canonical.com>
Subject: Re: Ability to crash a HVM guest by accessing /dev/hpet
Date: Wed, 21 Feb 2018 15:57:36 +0100
Message-ID: <84021af4-c833-4fd6-d715-aac1f4a8acec@canonical.com>
References: <6d5172da-c4f5-a275-229d-068899b056f6@canonical.com>
 <20180221144017.ol2zelgknomiehfn@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5155486994560932396=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221144017.ol2zelgknomiehfn@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5155486994560932396==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="CXd1wvNIRzS0NQ0x1NtEQMTR1IK90mk7t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CXd1wvNIRzS0NQ0x1NtEQMTR1IK90mk7t
Content-Type: multipart/mixed; boundary="ymrLXconr4lMja9pSOTyXymLUlNSy7YvO";
 protected-headers="v1"
From: Stefan Bader <stefan.bader@canonical.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>
Message-ID: <84021af4-c833-4fd6-d715-aac1f4a8acec@canonical.com>
Subject: Re: [Xen-devel] Ability to crash a HVM guest by accessing /dev/hpet
References: <6d5172da-c4f5-a275-229d-068899b056f6@canonical.com>
 <20180221144017.ol2zelgknomiehfn@MacBook-Pro-de-Roger.local>
In-Reply-To: <20180221144017.ol2zelgknomiehfn@MacBook-Pro-de-Roger.local>

--ymrLXconr4lMja9pSOTyXymLUlNSy7YvO
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 21.02.2018 15:40, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 21, 2018 at 03:12:15PM +0100, Stefan Bader wrote:
>> This seems to have been found by us[1] and Citrix[2] recently. To trig=
ger this
>> one needs to be root in the guest, so it is not super critical but sti=
ll it
>> seems to be a bit harsh that purely opening /dev/hpet read-only is lea=
ding to a
>> domain crash via xen/arch/x86/hvm/hpet.c@375(hpet_write):
>=20
> I'm quite surprised that Linux writes to the registers if the device
> is opened read-only.

[dropping Ian as the email address I got seems no longer valid]

Hi Roger,

it seems that this is the way the hpet character driver is done (not sure=
 that
is all correct). Opening in write mode actually seem to be forbidden and =
will
return -EINVAL.
This grabs one timer and then calls hpet_timer_set_irq() on that. And thi=
s
actually forces level triggered mode...

        timer =3D devp->hd_timer;

        /* we prefer level triggered mode */
        v =3D readl(&timer->hpet_config);
        if (!(v & Tn_INT_TYPE_CNF_MASK)) {
                v |=3D Tn_INT_TYPE_CNF_MASK;
                writel(v, &timer->hpet_config);
        }
        spin_unlock_irq(&hpet_lock);

-Stefan
>=20
>>
>>     case HPET_Tn_CFG(0):
>>     case HPET_Tn_CFG(1):
>>     case HPET_Tn_CFG(2):
>>         tn =3D HPET_TN(CFG, addr);
>>
>>         h->hpet.timers[tn].config =3D hpet_fixup_reg(new_val, old_val,=
 0x3f4e);
>>
>>         if ( timer_level(h, tn) )
>>         {
>>             gdprintk(XENLOG_ERR,
>>                      "HPET: level triggered interrupt not supported no=
w\n");
>>             domain_crash(current->domain);
>>             break;
>>         }
>>
>> The default in Linux seems to be level triggered. I wonder whether the=
re would
>> be any possible way to make this return as some error instead of blowi=
ng up?
>=20
> Xen not allowing level-triggered is actually breaking the spec for
> HPET AFAICT, since level triggered interrupts are not an optional
> feature of HPET. Options here would be to just ignore or inject a #GP
> I guess (which will also likely result in the guest crashing).
>=20
> The real solution is to implement level triggered interrupts, I can
> take a stab at this.
>=20
> Roger.
>=20



--ymrLXconr4lMja9pSOTyXymLUlNSy7YvO--

--CXd1wvNIRzS0NQ0x1NtEQMTR1IK90mk7t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJajYjgAAoJEOhnXe7L7s6jARMP/3o6rgQEtV8PPHpOpSJTZDxJ
9pRHEVMmAnEmzW4Hr8Zq+Sau1JAkocbQKcAOp/hQfFqsduPO+g47OEYihu8jQF+c
RjnfCPTtGNrhQx3AePDqDZ5jXQtkLUS5A1yk7EP+300OqCGdgl3YXfj49driB/kO
BKhRYMEwdSH1vl0Xfoa7/8x4ETRwnrRBFPcx9L2GzHbwhn3HsX0u77E8fhy8Dvcr
JQn/ox22lG6ZaSwLQTyaaoSbkwhnnPeQXjsZa6ghpDyzB4syG3Lqb+ia8QSNTXxQ
raoNZYOH6x+DAlOmN9AxCkgaMpg5OPhJxiHgQCy0PtFXV8NWNPNc58kxQAbRtVZn
psqfOBWWiWy7WNlJH7AzL2bpETlJTt7VcNInjxJBCER8OUnKukBHqGiuL2DDf9iL
Im0tGLfYOMtsEYE7pF7LhO9FStDAHhAG1xoLjlzW94SdhFDny7Jw0LBSU9tlQ9Qo
Li3cuhQmVi+eF3UNbd6NgxW3nngMd+oZmzhDc6nIpDNGgiLZfNEkwt+lkIxv+soG
enPM1bROifQ1qKEQXULqIyF0LqFNU+AgPibPw3LhNnQQuyDpeDnHPUWe9TMDdLBi
XbGjhCzpIlBZDf1sQsA9g2KXUhDEsw9bKPkglM//iZtKAx6cY6Gja/ngBL7I+PMx
wxYaJqtEGbPyXrytW8O6
=rFcW
-----END PGP SIGNATURE-----

--CXd1wvNIRzS0NQ0x1NtEQMTR1IK90mk7t--


--===============5155486994560932396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5155486994560932396==--
