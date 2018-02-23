From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V5] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Fri, 23 Feb 2018 04:53:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1910152F1@SHSMSX101.ccr.corp.intel.com>
References: <1518776535-2951-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518776535-2951-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTYsIDIwMTggNjoyMiBQTQo+IAo+IFRoZSBlbXVs
YXRpb24gbGF5ZXJzIG9mIFhlbiBsYWNrIFBDSUQgc3VwcG9ydCwgYW5kIGFzIHdlIG9ubHkgb2Zm
ZXIKPiBQQ0lEIHRvIEhBUCBndWVzdHMsIGFsbCB3cml0ZXMgdG8gQ1IzIGFyZSBoYW5kbGVkIGJ5
IGhhcmR3YXJlLAo+IGV4Y2VwdCB3aGVuIGludHJvc3BlY3Rpb24gaXMgaW52b2x2ZWQuIENvbnNl
cXVlbnRseSwgdHJ5aW5nIHRvIHNldAo+IENSMyB3aGVuIHRoZSBub2ZsdXNoIGJpdCBpcyBzZXQg
aW4gaHZtX3NldF9jcjMoKSBsZWFkcyB0byBkb21haW4KPiBjcmFzaGVzLiBUaGUgd29ya2Fyb3Vu
ZCBpcyB0byBjbGVhciB0aGUgbm9mbHVzaCBiaXQgaW4KPiBodm1fc2V0X2NyMygpLiBDUjMgdmFs
dWVzIGluIGh2bV9tb25pdG9yX2NyKCkgYXJlIGFsc28gc2FuaXRpemVkLgo+IEFkZGl0aW9uYWxs
eSwgYSBib29sIHBhcmFtZXRlciBub3cgcHJvcGFnYXRlcyB0bwo+IHtzdm0sdm14fV91cGRhdGVf
Z3Vlc3RfY3IoKSwgc28gdGhhdCBubyBmbHVzaGVzIG9jY3VyIHdoZW4KPiB0aGUgYml0IHdhcyBz
ZXQuCgpBYm92ZSBtZXNzYWdlIGlzIG5vdCB2ZXJ5IGNsZWFyIGZvciBwZW9wbGUgd2hvIGRpZG4n
dCBmb2xsb3cKcHJldmlvdXMgZGlzY3Vzc2lvbnMsIGUuZy4gd2h5IGxhY2tpbmcgUENJRCBzdXBw
b3J0IGluIGVtdWxhdGlvbiAKbGF5ZXIgd291bGQgbGVhZCB0byBkb21haW4gY3Jhc2g/IGFuZCB3
aHkgbm9mbHVzaCB0cmljayBjYW4gCmF2b2lkIHRoZSBzaXR1YXRpb24/IENhbiB5b3UgaGVscCBl
bGFib3JhdGUgaXQ/CgpidHcgSSBkaWRuJ3Qgc2VlIGFueSBwbGFjZSBzZXR0aW5nIHRoZSBuZXcg
bWFjcm8gCihYODZfQ1IzX05PRkxVU0gpLiBqdXN0IGNoZWNrIGFuZCBjbGVhci4gCgpUaGFua3MK
S2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
