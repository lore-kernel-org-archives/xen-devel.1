From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 4/7] x86/hvm: Rename v->arch.hvm_vcpu to
 v->arch.hvm
Date: Tue, 28 Aug 2018 21:59:11 +0300
Message-ID: <2531aacc-c1c3-9c8c-8f40-425b7b785e4a@bitdefender.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gOC8yOC8xOCA4OjM5IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZSB0cmFpbGluZyBf
dmNwdSBzdWZmaXggaXMgcmVkdW5kYW50LCBidXQgYWRkcyB0byBjb2RlIHZvbHVtZS4gIERyb3Ag
aXQuCj4gCj4gUmVmbG93IGxpbmVzIGFzIGFwcHJvcHJpYXRlLCBhbmQgc3dpdGNoIHRvIHVzaW5n
IHRoZSBuZXcgWEZSRUUvZXRjIHdyYXBwZXJzCj4gd2hlcmUgYXBwbGljYWJsZS4KPiAKPiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
