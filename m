From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [linux-3.18 bisection] complete
 test-amd64-amd64-pair
Date: Tue, 12 Feb 2019 04:39:21 -0700
Message-ID: <5C62B0690200007800215DCD@prv1-mh.provo.novell.com>
References: <E1gtSHm-0005fF-Jc@osstest.test-lab.xenproject.org>
 <23650.44390.535815.180747@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__Part9FA2AC79.3__="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtWPQ-0007m3-0L
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 11:39:28 +0000
In-Reply-To: <23650.44390.535815.180747@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Sasha Levin <sashal@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Aaron Brown <aaron.f.brown@intel.com>, Jeffrey T Kirsher <jeffrey.t.kirsher@intel.com>
List-Id: xen-devel@lists.xenproject.org

--=__Part9FA2AC79.3__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>>> On 12.02.19 at 12:26, <ian.jackson@citrix.com> wrote:
> Jan, are you investigating this regression ?

No, I'm not. I've said what I can say in a reply to an earlier bisection
report (from Dec 12th), attached again here for reference.

Jan

> osstest service owner writes ("[linux-3.18 bisection] complete=20
> test-amd64-amd64-pair"):
>> branch xen-unstable
>> xenbranch xen-unstable
>> job test-amd64-amd64-pair
>> testid xen-boot/dst_host
>>=20
>> Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-s=
table.git
>> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>> Tree: xen git://xenbits.xen.org/xen.git
>>=20
>> *** Found and reproduced problem changeset ***
>>=20
>>   Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/s=
table/linux-stable.git
>>   Bug introduced:  7b8052e19304865477e03a0047062d977309a22f
>>   Bug not present: d255d18a34a8d53ccc4a019dc07e17b6e8cf6bd1
>>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/1312=
78/=20
>>=20
>>=20
>>   commit 7b8052e19304865477e03a0047062d977309a22f
>>   Author: Jan Beulich <JBeulich@suse.com>
>>   Date:   Mon Oct 19 04:23:29 2015 -0600
>>  =20
>>       igb: fix NULL derefs due to skipped SR-IOV enabling
>>      =20
>>       [ Upstream commit be06998f96ecb93938ad2cce46c4289bf7cf45bc ]
>>      =20
>>       The combined effect of commits 6423fc3416 ("igb: do not re-init =
SR-IOV
>>       during probe") and ceee3450b3 ("igb: make sure SR-IOV init uses =
the
>>       right number of queues") causes VFs no longer getting set up, =
leading
>>       to NULL pointer dereferences due to the adapter's ->vf_data being =
NULL
>>       while ->vfs_allocated_count is non-zero. The first commit not =
only
>>       neglected the side effect of igb_sriov_reinit() that the second =
commit
>>       tried to account for, but also that of setting IGB_FLAG_HAS_MSIX,
>>       without which igb_enable_sriov() is effectively a no-op. Calling
>>       igb_{,re}set_interrupt_capability() as done here seems to address =
this,
>>       but I'm not sure whether this is better than sinply reverting the =
other
>>       two commits.
>>      =20
>>       Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>       Tested-by: Aaron Brown <aaron.f.brown@intel.com>
>>       Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
>>       Signed-off-by: Sasha Levin <sashal@kernel.org>
>>=20
>>=20
>> For bisection revision-tuple graph see:
>>   =20
> http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-3.18/tes=
t-am=20
> d64-amd64-pair.xen-boot--dst_host.html
>> Revision IDs in each graph node refer, respectively, to the Trees =
above.




--=__Part9FA2AC79.3__=
Content-Type: message/rfc822

Date: Thu, 13 Dec 2018 01:26:24 -0700
From: "Jan Beulich" <JBeulich@suse.com>
To: "Sasha Levin" <sashal@kernel.org>,
 "osstest service owner" <osstest-admin@xenproject.org>
Cc: "xen-devel" <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [linux-3.18 bisection] complete
 test-amd64-amd64-pair
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>>> On 12.12.18 at 22:41, <osstest-admin@xenproject.org> wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-amd64-amd64-pair
> testid xen-boot/src_host
>=20
> Tree: linux=20
> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
>=20
> *** Found and reproduced problem changeset ***
>=20
>   Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/st=
able/linux-stable.git
>   Bug introduced:  7b8052e19304865477e03a0047062d977309a22f
>   Bug not present: d255d18a34a8d53ccc4a019dc07e17b6e8cf6bd1
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/13127=
8/=20
>=20
>=20
>   commit 7b8052e19304865477e03a0047062d977309a22f
>   Author: Jan Beulich <JBeulich@suse.com>
>   Date:   Mon Oct 19 04:23:29 2015 -0600
>  =20
>       igb: fix NULL derefs due to skipped SR-IOV enabling

_Very_ interesting. An over three years old commit was determined
to cause whatever regression it is. But wait - that's the date of the
mainline commit, not that of the backport (which was done a month
ago). I notice that of the two original commits the combination of
which the one here is supposed to fix, only one actually got
backported. Hence I wonder whether backporting the one here
was actually appropriate.

Jan



--=__Part9FA2AC79.3__=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=__Part9FA2AC79.3__=--
