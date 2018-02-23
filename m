From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 16/16] xen: Convert page_to_mfn and
 mfn_to_page to use typesafe MFN
Date: Fri, 23 Feb 2018 17:31:54 +0000
Message-ID: <20180223173154.pipgxwpqutukumul@citrix.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180221140259.29360-17-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjEsIDIwMTggYXQgMDI6MDI6NTlQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE1vc3Qgb2YgdGhlIHVzZXJzIG9mIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFnZSBh
cmUgZWl0aGVyIG92ZXJyaWRpbmcKPiB0aGUgbWFjcm9zIHRvIG1ha2UgdGhlbSB3b3JrIHdpdGgg
bWZuX3Qgb3IgdXNlIG1mbl94L19tZm4gYmVjYXVzZSB0aGUKPiByZXN0IG9mIHRoZSBmdW5jdGlv
biB1c2UgbWZuX3QuCj4gCj4gU28gbWFrZSBwYWdlX3RvX21mbiBhbmQgbWZuX3RvX3BhZ2UgcmV0
dXJuIG1mbl90IGJ5IGRlZmF1bHQuIFRoZSBfXyoKPiB2ZXJzaW9uIGFyZSBub3cgZHJvcHBlZCBh
cyB0aGlzIHBhdGNoIHdpbGwgY29udmVydCBhbGwgdGhlIHJlbWFpbmluZwo+IG5vbi10eXBlc2Fm
ZSBjYWxsZXJzLgo+IAo+IE9ubHkgcmVhc29uYWJsZSBjbGVhbi11cHMgYXJlIGRvbmUgaW4gdGhp
cyBwYXRjaC4gVGhlIHJlc3Qgd2lsbCB1c2UKPiBfbWZuL21mbl94IGZvciB0aGUgdGltZSBiZWlu
Zy4KPiAKPiBMYXN0bHksIGRvbWFpbl9wYWdlX3RvX21mbiBpcyBhbHNvIGNvbnZlcnRlZCB0byB1
c2UgbWZuX3QgZ2l2ZW4gdGhhdAo+IG1vc3Qgb2YgdGhlIGNhbGxlcnMgYXJlIG5vdyBzd2l0Y2hl
ZCB0byBfbWZuKGRvbWFpbl9wYWdlX3RvX21mbiguLi4pKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
