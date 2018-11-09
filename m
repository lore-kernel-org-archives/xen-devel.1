From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V4 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 09 Nov 2018 03:34:51 -0700
Message-ID: <5BE562CB02000078001FA18D@prv1-mh.provo.novell.com>
References: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
 <1541083542-22464-4-git-send-email-rcojocaru@bitdefender.com>
 <65ef6cc6-a198-f875-ec11-e3727360f257@citrix.com>
 <d3387f54-04fb-3fdc-6b5f-9cbfc725fef2@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mulf=nu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gL47p-0005Xv-Gm
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 10:34:53 +0000
In-Reply-To: <d3387f54-04fb-3fdc-6b5f-9cbfc725fef2@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE5OjM3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gdGhlIGZpcnN0IHBhdGNoIG9mIHRoZSBzZXJpZXM6IGNhbiBpdCBnbyBpbiBpbmRl
cGVuZGVudGx5LCBzaW5jZSBKYW4KPiBpcyBPSyB3aXRoIGl0IGFuZCBpdCBqdXN0IGdvdCB5b3Vy
IGFjaz8gT3Igc2hvdWxkIEkganVzdCBhZGQgdGhlIGFjayBhbmQKPiBjYXJyeSBpdCBvdmVyIHRv
IHRoZSBuZXh0IHZlcnNpb24gb2YgdGhlIHNlcmllcz8KCldlbGwsIEkgd291bGQgaGF2ZSBjb21t
aXR0ZWQgaXQsIGlmIG9ubHkgaXQgaGFkIGEgVk1YL0VQVCBtYWludGFpbmVyCmFjay4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
