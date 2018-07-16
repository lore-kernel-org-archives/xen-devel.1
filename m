From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 11/13] x86: Introduce struct cpu_policy
 to refer to a group of individual policies
Date: Mon, 16 Jul 2018 11:32:35 +0100
Message-ID: <20180716103235.cv5ytw25x7czn332@citrix.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-12-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1531512194-6865-12-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMTMsIDIwMTggYXQgMDk6MDM6MTJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIGlzIHByZXAgd29yayBmb3IgdGhlIGZvbGxvd2luZyBwYXRjaCAtIHBsZWFz
ZSByZWZlciB0byBpdCBhcyB3ZWxsLgo+IAo+IFdoZW4gYXVkaXRpbmcgYW5kIG1hbmlwdWxhdGlu
ZyBwb2xpY2llcywgaXQgaXMgbmVjZXNzYXJ5IHRvIGRvIHNvIHdpdGggYQo+IGNvbXBsZXRlIHNl
dCBvZiBwb2xpY2llcywgZHVlIHRvIHRoZSBpbnRlcmRlcGVuZGVuY2VzIG9mIHRoZSBjb250ZW50
cy4gIEEKPiBjb250YWluaW5nIHN0cnVjdHVyZSBsaWtlIHRoaXMgd2lsbCBhbGxvdyBmb3IgY2xl
YXJlciBBUElzIGFuZCBjb2RlLgo+IAo+IEFzIGEgZmlyc3QgdXNlciwgdGhpcyBzdHJ1Y3R1cmUg
aXMgY29udmVuaWVudCBmb3IgdGhlIG1hcHBpbmcgdXNlZCBieQo+IFhFTl9TWVNDVExfZ2V0X2Nw
dV9wb2xpY3kgKGltcGxlbWVudGVkIGluIHRoZSBuZXh0IHBhdGNoKSwgYW5kIGZvciBhdWRpdGlu
Zwo+IChsYXRlciB3aGVuIFhFTl9ET01DVExfc2V0X2NwdV9wb2xpY3kgaXMgaW1wbGVtZW50ZWQp
Lgo+IAo+IEF0IHRoaXMgcG9pbnQsIHRoZSBkaXN0aW5jdGlvbiBiZXR3ZWVuICpfbWF4IGFuZCAq
X2RlZmF1bHQgaXMgaW50cm9kdWNlZCBpbnRvCj4gdGhlIEFCSS4gIEZvciBub3csICpfZGVmYXVs
dCBpcyBtYXBwZWQgdG8gKl9tYXgsIGJ1dCBmdXR1cmUgZGV2ZWxvcG1lbnQgd29yawo+IHdpbGwg
cmVzdWx0IGluICpfZGVmYXVsdCBiZWluZyBhIGxvZ2ljYWwgc3Vic2V0IG9mICpfbWF4Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
