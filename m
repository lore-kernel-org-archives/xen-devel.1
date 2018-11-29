From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 29 Nov 2018 14:21:45 +0100
Message-ID: <20181129142145.6aee04b4.olaf@aepfle.de>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <ba4e6e5f-b342-10e5-971e-1e71d50b3073@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5336540474776954044=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ba4e6e5f-b342-10e5-971e-1e71d50b3073@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============5336540474776954044==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/N5CqWjeViFKd5hxySyd5U66"; protocol="application/pgp-signature"

--Sig_/N5CqWjeViFKd5hxySyd5U66
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks Andrew and Ian for taking the time to look at this change.
In turn it took me some time to get back to this topic.

Am Mon, 1 Oct 2018 13:39:51 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> On 07/06/18 14:08, Olaf Hering wrote:
> > Add an option to control when vTSC emulation will be activated for a
> > domU with tsc_mode=3Ddefault. Without such option each TSC access from
> > domU will be emulated, which causes a significant perfomance drop for
> > workloads that make use of rdtsc.
> >
> > One option to avoid the TSC option is to run domUs with tsc_mode=3Dnati=
ve.
> > This has the drawback that migrating a domU from a "2.3GHz" class host
> > to a "2.4GHz" class host may change the rate at wich the TSC counter
> > increases, the domU may not be prepared for that.
> >
> > With the new option the host admin can decide how a domU should behave
> > when it is migrated across systems of the same class. Since there is
> > always some jitter when Xen calibrates the cpu_khz value, all hosts of
> > the same class will most likely have slightly different values. As a
> > result vTSC emulation is unavoidable. Data collected during the incident
> > which triggered this change showed a jitter of up to 200 KHz across
> > systems of the same class. =20
>=20
> Do you have any further details of the systems involved?=C2=A0 If they are
> identical systems, they should all have the same real TSC frequency, and
> its a known issue that Xen isn't very good at working out the
> frequency.=C2=A0 TBH, fixing that would be far better overall.

My test hosts have a E5504 cpu. The ones where the issue was reported
use "E7-8880 v3" today, the used hardware two years ago was likely older.

=46rom what I understand the TSC frequency stored in "cpu_khz" is just an
estimated value, not the real hardware frequency. Still, it is used to
decide if two hosts tick at the same speed. The domU kernel may use the
estimated value for its timekeeping, I think it does the same estimation
as Xen itself. But, I have to dig into that.

To me it looks like domUs should run ntpd themselves if there is a plan
to migrate them at some point in the future. At least if they use TSC
for timekeeping. With ntpd the domU would detect time skew, even if it
was not yet migrated to another host. I do not know much about timekeeping,
so this is just a guess on my side.


> > Existing padding fields are reused to store vtsc_khz_tolerance as u16.
> > The padding is sent as zero in write_tsc_info to the receving host.
> > The padding is undefined if the changed code runs as receiver. =20
> I'm not sure what you mean by this final sentence.

I have removed that part, since incoming padding is in practice always zero.

> > handle_tsc_info has no code to verify that padding is indeed zero. Due
> > to the lack of a version field it is impossible to know if the sender
> > already has the newly introduced vtsc_tolerance field. In the worst
> > case the receiving domU will get an unemulated TSC. =20
>=20
> The lack of padding verification is deliberate, for forwards
> compatibility.=C2=A0 Why does the sending code matter?=C2=A0 One way or a=
nother,
> if the field is 0, the option wasn't present or wasn't configured.=C2=A0
> Neither of these situations affect the decision-making that the
> receiving side needs to perform.

> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > Reviewed-by: Wei Liu <wei.liu2@citrix.com> (v07/v08)
> > Reviewed-by: Jan Beulich <jbeulich@suse.com> (v08) =20
>=20
> I'm still -0.5 for this patch.=C2=A0 I can appreciate why you want it, bu=
t it
> is a gross hack which only works when you don't skew time more than NTP
> in the guest can cope with.=C2=A0 My gut feeling is that there will be ot=
her
> more subtle fallout.


I will do some research regarding how much skewing a domU can handle.
As said in another reply, the expected time drift with a difference of
just 11 kHz in the cpu_khz variable on a 2.6GHz system is about 0.3 seconds
during a day.

IanJ requested clarification for how much time skew a system can handle.
Perhaps this should have been part of the initial submission for
tsc_mode=3Dnative already. I will do some research. Also some of the concer=
ns
about missing documentation are already covered in paragraph #3 of the
commit message.

I will do some more testing with staging and send v10 next week.
The accumulated changes for a v10, so far:
v10:
 - rebase to 402411ec40
 - update write_libxc_tsc_info to handle the new parameter vtsc_tolerance_k=
hz
   without this change, migration from xen-4.5 will fail (Andrew)
 - add newline to tsc_set_info (Andrew)
 - add measurment unit to libxc-migration-stream.pandoc (Andrew)
 - add pointer to xen-tscmode(7) in xl.cfg(5)/vtsc_tolerance_khz (Andrew)
 - reword the newly added paragraph in xen-tscmode(7) (Andrew),
   and also mention that it is about the measured/estimated TSC value
   rather than the real value. The latter is simply unknown.
 - simplify wording regarding the value of padding field in old Xen
   versions, the previous one turned out to be confusing and not helpful


Olaf

--Sig_/N5CqWjeViFKd5hxySyd5U66
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW//n6gAKCRBdQqD6ppg2
fjfUAJ4wVY6IJMZQLOEfmVxqOjbq2JpmUgCg9iCup8lQq36lKZCJ3QKaPwSBMog=
=nDPT
-----END PGP SIGNATURE-----

--Sig_/N5CqWjeViFKd5hxySyd5U66--


--===============5336540474776954044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5336540474776954044==--
