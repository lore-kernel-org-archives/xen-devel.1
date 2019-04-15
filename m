From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH] x86/boot: Don't leak the module_map
 allocation in __start_xen()
Date: Mon, 15 Apr 2019 01:55:43 -0600
Message-ID: <5CB438FF02000078001553CC@prv1-mh.provo.novell.com>
References: <1555096630-22406-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1555096630-22406-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xen.org, wei.liu2@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA0LzEyLzE5IDk6
MTcgUE0gPj4+Cj5FdmVyIHNpbmNlIGl0cyBpbnRyb2R1Y2lvbiBpbiBjL3MgNDM2ZmI0NjIgIng4
Ni9taWNyb2NvZGU6IGVuYWJsZSBib290Cj50aW1lIChwcmUtRG9tMCkgbG9hZGluZyIsIHRoZSBh
bGxvY2F0aW9uIGhhcyBnb25lIHVuLWZyZWVkLCBhbmQgaGFzIGl0cyBmaW5hbAo+dXNlIGFzIHBh
cnQgb2YgY29uc3RydWN0aW5nIGRvbTAuCj4KPlhlbiBhbHJlYWR5IGNvbnNpZGVyZXMgaXQgYW4g
ZXJyb3IgdG8gaGF2ZSBtb3JlIHRoYW4gYSBzaW5nbGUgdW5hY2NvdW50ZWQtZm9yCj5tb2R1bGUg
KGFnYWluLCBsb2dpYyBmcm9tIHRoZSBzYW1lIGNoYW5nZSksIGFuZCB3aWxsIG9ubHkgcGFzcyB0
aGUgZmlyc3Qgb25lCj50byBkb20wIGFzIHRoZSBpbml0cmQuCj4KPkluc3RlYWQgb2YgaGF2aW5n
IGFuIDggYnl0ZSBwb2ludGVyIHRvIGEgYml0bWFwIHdoaWNoIHdvbid0IGV4Y2VlZCA0IGJpdHMg
d2lkZQo+aW4gYW55IHByb2R1Y3Rpb24gc2NlbmFyaW8gKGRvbTAga2VybmVsLCBpbml0cmQsIFhT
TSBibG9iIGFuZCBtaWNyb2NvZGUgYmxvYiksCj5hbGxvY2F0ZSBtb2R1bGVfbWFwW10gb24gdGhl
IHN0YWNrIGFuZCBhZGQgYSBzYW5pdHkgYm91bmQgZm9yIG1iaS0+bW9kc19jb3VudC4KPgo+U2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJJ20gYSBsaXR0bGUgY3Vy
aW91cyBob3cgeW91IG1hbmFnZWQgdG8gc3BvdCB0aGlzIHByZXR0eSBzbWFsbCwgb25lLXRpbWUg
bGVhayAuLi4KCkphbgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
