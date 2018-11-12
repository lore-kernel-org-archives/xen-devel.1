From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Unify hvm_event_pending()'s API
 with the !CONFIG_HVM version
Date: Mon, 12 Nov 2018 10:07:24 +0000
Message-ID: <c63ee364-a9bc-a5d9-c2d3-81e478524312@citrix.com>
References: <1541774547-31337-1-git-send-email-andrew.cooper3@citrix.com>
 <5BE94EA002000078001FABA2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BE94EA002000078001FABA2@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTEvMjAxOCAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMTEuMTgg
YXQgMTU6NDIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UuCj4gU28gSSB1bmRlcnN0YW5kIHRoYXQgInVuaWZ5IiBtZWFucyBjb252ZXJ0
aW5nIHRoZSByZXR1cm4gdHlwZSB0bwo+IGJvb2wuIFlvdSBjb3VsZCBoYXZlIHNhaWQgc28uCgpQ
ZXJoYXBzLCBidXQgdGhhdCBtaXNzZXMgdGhlIHBvaW50IG9mIG1ha2luZyB0aGUgY2hhbmdlLgoK
VGhlIHBhdGNoIGludHJvZHVjaW5nIHRoZSAhQ09ORklHX0hWTSB2ZXJzaW9uIHNob3VsZCBoYXZl
IHVzZWQKaW50L25vbi1jb25zdCBzbyB0aGUgQVBJIHdhcyBzYW1lLCBvciBoYWQgdGhpcyBwYXRj
aCBhcyBhIHByZXJlcXVpc2l0ZQp0byB1cGRhdGUgdGhlIEFQSSB0byBvdXIgbmV3IHN0YW5kYXJk
cywgYW5kIHRoZW4gZHVwbGljYXRlIGl0IGZvciB0aGUKIUNPTkZJR19IVk0gY2FzZS4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
