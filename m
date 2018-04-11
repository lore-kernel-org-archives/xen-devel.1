From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: Resume from suspend to RAM broken when using early
 microcode updates
Date: Wed, 11 Apr 2018 12:46:00 +0000
Message-ID: <e9f0bd47-c52b-501b-4786-b7fea2922b82@invisiblethingslab.com>
References: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
 <6fbc10ea-d222-94e0-0a60-76cbc6ba1ab2@citrix.com>
 <d8da2a1f-b2e8-f8c3-4e33-bc84ac0cc7d4@invisiblethingslab.com>
 <5ACE177902000078001BA47D@prv1-mh.provo.novell.com>
 <5ACE18E902000078001BA498@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4125894166612569669=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lz4q=ha=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f6F8g-000333-BD
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 12:46:14 +0000
In-Reply-To: <5ACE18E902000078001BA498@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4125894166612569669==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="2DESKBl6Aeo2UWepowcIvesJ9WP94fwAn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2DESKBl6Aeo2UWepowcIvesJ9WP94fwAn
Content-Type: multipart/mixed; boundary="pmc096aylsshAInYYkXUAygAXxSF2SP9E";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <e9f0bd47-c52b-501b-4786-b7fea2922b82@invisiblethingslab.com>
Subject: Re: Resume from suspend to RAM broken when using early microcode
 updates
References: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
 <6fbc10ea-d222-94e0-0a60-76cbc6ba1ab2@citrix.com>
 <d8da2a1f-b2e8-f8c3-4e33-bc84ac0cc7d4@invisiblethingslab.com>
 <5ACE177902000078001BA47D@prv1-mh.provo.novell.com>
 <5ACE18E902000078001BA498@prv1-mh.provo.novell.com>
In-Reply-To: <5ACE18E902000078001BA498@prv1-mh.provo.novell.com>

--pmc096aylsshAInYYkXUAygAXxSF2SP9E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
>>>> On 11.04.18 at 14:11, <JBeulich@suse.com> wrote:
>>>>> On 11.04.18 at 14:01, <simon@invisiblethingslab.com> wrote:
>>> Andrew Cooper:
>>>> On 11/04/18 12:48, Simon Gaiser wrote:
>>>>> Hi,
>>>>>
>>>>> when I use early microcode loading with the microcode update with t=
he
>>>>> BTI mitigations, resuming from suspend to RAM is broken.
>>>>>
>>>>> Based on added logging to enter_state() (from power.c) it doesn't
>>>>> survive the local_irq_restore(flags) call (at least a printk() afte=
r the
>>>>> call doesn't output anything on the serial console).
>>>>>
>>>>> I guess that some irq handler tries to use IBRS/IBPB. But the micro=
code
>>>>> is only loaded later.
>>>>>
>>>>> If I simply move the microcode_resume_cpu(0) directly before the
>>>>> local_irq_restore(flags) everything seems to work fine. But I'm not=
 sure
>>>>> if this has unintended consequences.
>>>>>
>>>>> I tested the above with Xen 4.8.3 from Qubes which includes the BTI=
 and
>>>>> microcode patches from staging-4.8. AFAICS there are no commits whi=
ch
>>>>> changes the affected code or other commits which sound relevant so =
this
>>>>> probably affected also all the newer branches.
>>>>
>>>> S3 support is a very unloved area of the hypervisor.
>>>>
>>>> Yes - we definitely need to get microcode reloaded before interrupts=
 are
>>>> enabled.
>>>
>>> Do you see any problems with simply moving microcode_resume_cpu(0)
>>> directly before the local_irq_restore(flags) call? (I'm not familiar
>>> with the code at all and (early) resume handling sounds like somethin=
g
>>> which is easy to break in non obvious ways)
>>
>> Yes, there would be a problem: microcode_resume_cpu()
>> spin_lock()-s almost first thing, and this would break our
>> (simplistic) lock checking. Putting it also ahead of
>> spin_debug_enable() should work otoh.
>>
>> Once at it, cpufreq_add_cpu() should be moved ahead of the
>> enable_cpu label as well, as cpufreq_del_cpu() wasn't called
>> yet at the point of the only goto to that label.
>=20
> And I think console_end_sync() want to be moved earlier then
> as well.

Where exactly? console_end_sync() seems to match the position of
console_start_sync().


--pmc096aylsshAInYYkXUAygAXxSF2SP9E--

--2DESKBl6Aeo2UWepowcIvesJ9WP94fwAn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrOA6gACgkQkO9xfO/x
ly8IfRAAm2xA26f9M5No5DM6/XiRdDrL2Yh1cxhkrZMtMzIAzlsk01OL+W64AI+P
Yt1KpK32TYrV+wqmdl5oI+G8RrTU++RCIfY77vVF7kE51i6FOwJVRH+D0cM7LDsD
gvSmgxubmFeAeFObU3XQwm0qjQG2zbWC6etl7vyT3xgjYiMtKgMd3x4m0M1DEYhl
iu71iG4DHlpm7WAuaLc/jonT33v1ku1jgfipNv9Hi46/58RBW6GYyNQARfX4syTh
R4zcy9qyWC2QdW2luFwhcdO/xvRb0sgIcIFSdkz+jR464MBgAslbCilfkFtSEmeO
wg6zjDBVFWkrDdDHxicpgmGwAbK9GbD/7WaFnX6uWx5g8IoDB/yxNKE0vOpdJqPQ
poURZva9L8qGKuJETUVXvY98//PE2O7sCISeST2Cu3O/UlYm5ryPJyLtT+bMjvcr
ojt1EgzK3GR3kfq5v+/FbEaXFSmh46b763uABhGLG8I2dGEfxlzixwJflWdZcsIA
WKxZ4FlxTY5KQ2/YITNe6NIsTgFa3epJpyaWHq+74r75L/jzJzcA50GY5TqCDpHu
JOxYAIU8Z//wyDPIOYsks5PD6dwc1ZkAyefRy0YDtudTrHO6MypKjgM+CFwZpoN3
ofEWuOBHiLX2ZBlGqLXCrc4Du+L+rgpquLAeKBjHCXGAgmcb7mA=
=UT8Y
-----END PGP SIGNATURE-----

--2DESKBl6Aeo2UWepowcIvesJ9WP94fwAn--


--===============4125894166612569669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4125894166612569669==--
