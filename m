From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/domctl: Drop vcpu_alloc_lock
Date: Thu, 6 Sep 2018 11:47:50 +0100
Message-ID: <20180906104750.p6a2pkitssrknunx@zion.uk.xensource.com>
References: <1536174925-5500-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1536174925-5500-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMDg6MTU6MjVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBTaW5jZSBpdHMgaW50cm9kdWN0aW9uIGluIGMvcyA4Y2JiNTI3OGUgIng4Ni9BTUQ6
IEFkZCBzdXBwb3J0IGZvciBBTUQncyBPU1ZXCj4gZmVhdHVyZSBpbiBndWVzdHMiLCB0aGUgT1NW
VyBkYXRhIGhhcyBiZWVuIGNvcnJlY3RlZCB0byBiZSBwZXItZG9tYWluIHJhdGhlcgo+IHRoYW4g
cGVyLXZjcHUsIGFuZCBpcyBpbml0aWFsaXNlZCBkdXJpbmcgWEVOX0RPTUNUTF9jcmVhdGVkb21h
aW4uCj4gCj4gRnVydGhlcm1vcmUsIGJlY2F1c2UgWEVOUEZfbWljcm9jb2RlX3VwZGF0ZSB1c2Vz
IGh5cGVyY2FsbCBjb250aW51YXRpb25zIHRvCj4gbW92ZSBiZXR3ZWVuIENQVXMsIGl0IGRyb3Bz
IHRoZSB2Y3B1X2FsbG9jX2xvY2sgbWlkIHVwZGF0ZSwgbWVhbmluZyB0aGF0IGl0Cj4gZGlkbid0
IHByb3ZpZGVkIHRoZSBpbnRlcmxvY2sgZ3VhcmFudGVlIHRoYXQgdGhlIE9TVlcgcGF0Y2ggd2Fz
IGxvb2tpbmcgZm9yIGluCj4gdGhlIGZpcnN0IHBsYWNlLgo+IAo+IFRoaXMgaW50ZXJsb2NrIHNl
cnZlcyBubyBwdXJwb3NlLCBzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBkcm9wIGl0IGFuZAo+
IHJlbW92ZSBhIGdsb2JhbCBzcGlubG9jayBmcm9tIHRoZSBoeXBlcnZpc29yLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
