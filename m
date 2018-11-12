From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: Unify hvm_event_pending()'s API
 with the !CONFIG_HVM version
Date: Mon, 12 Nov 2018 03:15:23 -0700
Message-ID: <5BE952BB02000078001FABE6@prv1-mh.provo.novell.com>
References: <1541774547-31337-1-git-send-email-andrew.cooper3@citrix.com>
 <5BE94EA002000078001FABA2@prv1-mh.provo.novell.com>
 <c63ee364-a9bc-a5d9-c2d3-81e478524312@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c63ee364-a9bc-a5d9-c2d3-81e478524312@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDExOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTIvMTEvMjAxOCAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA5
LjExLjE4IGF0IDE1OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4KPj4gU28gSSB1bmRlcnN0YW5kIHRoYXQgInVuaWZ5IiBtZWFu
cyBjb252ZXJ0aW5nIHRoZSByZXR1cm4gdHlwZSB0bwo+PiBib29sLiBZb3UgY291bGQgaGF2ZSBz
YWlkIHNvLgo+IAo+IFBlcmhhcHMsIGJ1dCB0aGF0IG1pc3NlcyB0aGUgcG9pbnQgb2YgbWFraW5n
IHRoZSBjaGFuZ2UuCj4gCj4gVGhlIHBhdGNoIGludHJvZHVjaW5nIHRoZSAhQ09ORklHX0hWTSB2
ZXJzaW9uIHNob3VsZCBoYXZlIHVzZWQKPiBpbnQvbm9uLWNvbnN0IHNvIHRoZSBBUEkgd2FzIHNh
bWUsIG9yIGhhZCB0aGlzIHBhdGNoIGFzIGEgcHJlcmVxdWlzaXRlCj4gdG8gdXBkYXRlIHRoZSBB
UEkgdG8gb3VyIG5ldyBzdGFuZGFyZHMsIGFuZCB0aGVuIGR1cGxpY2F0ZSBpdCBmb3IgdGhlCj4g
IUNPTkZJR19IVk0gY2FzZS4KCkFsbCBmaW5lLCBqdXN0IHRoYXQgaXQgd291bGQgaGF2ZSBiZWVu
IG5pY2UgaWYgdGhlIGRlc2NyaXB0aW9uIGhlcmUKc2FpZCBzbGlnaHRseSBtb3JlIHRoYW4ganVz
dCAiTm8gZnVuY3Rpb25hbCBjaGFuZ2UuIgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
