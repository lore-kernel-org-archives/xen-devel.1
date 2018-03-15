From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 12/14] x86/HVM: use x86emul_write_xcr()
Date: Thu, 15 Mar 2018 15:43:30 +0000
Message-ID: <799137cc-4fca-9744-546b-40414cd12862@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7F3102000078001B22CA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewVFb-0006e1-7k
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 15:57:07 +0000
In-Reply-To: <5AAA7F3102000078001B22CA@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTM6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC4uLiAgaW5zdGVhZCBvZiBk
aXJlY3RseSBjYWxsaW5nIGhhbmRsZV94c2V0YnYoKSwgdG8gbWFrZSB1c2Ugb2YgdGhlCj4gYWRk
aXRpb25hbCBjaGVja2luZyB0aGVyZS4KPgo+IEFsc28gZG9uJ3QgY2FsbCBodm1fbW9uaXRvcl9j
clgoWENSMCwgLi4uKSBmb3IgaW5kZXhlcyBvdGhlciB0aGFuIHplcm8KPiBhbnltb3JlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
