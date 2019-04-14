From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/tasklet: Fix return value truncation on
 arm64
Date: Sun, 14 Apr 2019 17:16:34 +0100
Message-ID: <f27e5cf1-3928-808b-dda4-ae8acaa23c2b@arm.com>
References: <1554989127-31772-1-git-send-email-andrew.cooper3@citrix.com>
 <5CB073940200007800226D98@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5CB073940200007800226D98@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzEyLzE5IDEyOjE2IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMS4w
NC4xOSBhdCAxNToyNSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBUaGUg
dXNlIG9mIHJldHVybl9yZWcoKSBhc3N1bWVzIEFSTSdzIDMyYml0IEFCSS4gIFRoZXJlZm9yZSwg
YSBmYWlsdXJlIHN1Y2ggYXMKPj4gLUVJTlZBTCB3aWxsIGFwcGVhciBhcyBhIGxhcmdlIHBvc2l0
aXZlIG51bWJlciBuZWFyIDQgYmlsbGlvbiB0byBhIDY0Yml0IEFSTQo+PiBndWVzdCB3aGljaCBo
YXBwZW5zIHRvIHVzZSBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCkuCj4+Cj4+IEludHJvZHVj
ZSBhIG5ldyBhcmNoX2h5cGVyY2FsbF90YXNrbGV0X3Jlc3VsdCgpIGhvb2sgd2hpY2ggaXMgaW1w
bGVtZW50ZWQgYnkKPj4gYm90aCBhcmNoaXRlY3R1cmVzLCBhbmQgZHJvcCB0aGUgcmV0dXJuX3Jl
ZygpIG1hY3Jvcy4gIFRoaXMgbG9naWMgd2lsbCBiZQo+PiBleHRlbmRlZCBpbiBhIGxhdGVyIGNo
YW5nZSB0byBtYWtlIGNvbnRpbnVhdGlvbnMgb3V0IG9mIHRoZSB0YXNrbGV0IHdvcmsuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4gCj4gT24gdGhlIGFzc3VtcHRpb24gdGhhdCBzaW1wbHkgZml4aW5nIEFybSdzIHJldHVybl9y
ZWcoKSB3b3VsZAo+IG5vdCBzdWZmaWNlIHdpdGggeW91ciBmdXJ0aGVyIHBsYW5zCgpJIHdvdWxk
IGRlZmluaXRlbHkgcHJlZmVyIHRvIGtlZXAgYSBzdGF0aWMgaW5saW5lIGZ1bmN0aW9uIHVubGVz
cyB0aGVyZSAKYXJlIHBsYW4gdG8gbWFrZSBhcmNoX2h5cGVyY2FsbF90YXNrbGV0X3Jlc3VsdCBt
b3JlIGNvbXBsZXguCgpBbmRyZXcsIGNvdWxkIHlvdSBlbmxpZ2h0ZW4gdXMgb24geW91ciBwbGFu
cz8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
