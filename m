From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] Revert "xen/balloon: Mark unallocated host
 memory as UNUSABLE"
Date: Tue, 27 Nov 2018 17:42:45 -0500
Message-ID: <1fe8626c-6832-5ffd-9331-48925324cc4e__24131.2662525617$1543358522$gmane$org@oracle.com>
References: <1543352301-29952-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vt+r=og=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gRm4K-0001em-Nf
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 22:43:00 +0000
In-Reply-To: <1543352301-29952-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjcvMTggMzo1OCBQTSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gVGhpcyByZXZlcnRz
IGNvbW1pdCBiM2NmODUyOGJiMjFmZWJiNjUwYTdlY2JmMDgwZDA2NDdiZTQwYjlmLgo+Cj4gVGhh
dCBjb21taXQgdW5pbnRlbnRpb25hbGx5IGJyb2tlIFhlbiBiYWxsb29uIG1lbW9yeSBob3RwbHVn
IHdpdGgKPiAiaG90cGx1Z191bnBvcHVsYXRlZCIgc2V0IHRvIDEuIEFzIGxvbmcgYXMgIlN5c3Rl
bSBSQU0iIHJlc291cmNlCj4gZ290IGFzc2lnbmVkIHVuZGVyIGEgbmV3ICJVbnVzYWJsZSBtZW1v
cnkiIHJlc291cmNlIGluIElPL01lbSB0cmVlCj4gYW55IGF0dGVtcHQgdG8gb25saW5lIHRoaXMg
bWVtb3J5IHdvdWxkIGZhaWwgZHVlIHRvIGdlbmVyYWwga2VybmVsCj4gcmVzdHJpY3Rpb25zIG9u
IGhhdmluZyAiU3lzdGVtIFJBTSIgcmVzb3VyY2VzIGFzIDFzdCBsZXZlbCBvbmx5Lgo+Cj4gVGhl
IG9yaWdpbmFsIGlzc3VlIHRoYXQgY29tbWl0IGhhcyB0cmllZCB0byB3b3JrYXJvdW5kIGZhNTY0
YWQ5NjM2Ngo+ICgieDg2L1BDSTogRW5hYmxlIGEgNjRiaXQgQkFSIG9uIEFNRCBGYW1pbHkgMTVo
IChNb2RlbHMgMDAtMWYsIDMwLTNmLAo+IDYwLTdmKSIpIGFsc28gZ290IGFtZW5kZWQgYnkgdGhl
IGZvbGxvd2luZyAwM2E1NTE3MzQgKCJ4ODYvUENJOiBNb3ZlCj4gYW5kIHNocmluayBBTUQgNjQt
Yml0IHdpbmRvdyB0byBhdm9pZCBjb25mbGljdCIpIHdoaWNoIG1hZGUgdGhlCj4gb3JpZ2luYWwg
Zml4IHRvIFhlbiBiYWxsb29uaW5nIHVubmVjZXNzYXJ5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSWdv
ciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gLS0tCj4gSW4gbWFpbCB0
aHJlYWQgWzFdIGl0IHdhcyBhZ3JlZWQgdG8gcmV2ZXJ0IHRoZSBjaGFuZ2UgZHVlIHRvIHRlY2hu
aWNhbAo+IGNvbWxpY2F0aW9ucyBvZiBmaXhpbmcgaXQgYW5kIHRoZSBmYWN0IHRoYXQgdGhlcmUg
aXMgbm8gYW55IHN0cm9uZyByZWFzb24KPiB0byBrZWVwIGl0Lgo+Cj4gWzFdIGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMS9tc2cwMjgz
NC5odG1sCj4gLS0tCj4gIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYyB8IDc4IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3g4Ni94ZW4vc2V0
dXAuYyAgICAgfCAgNiArKy0tCj4gIGRyaXZlcnMveGVuL2JhbGxvb24uYyAgICB8IDY1ICsrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS94ZW4vYmFsbG9v
bi5oICAgIHwgIDUgLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE0
MSBkZWxldGlvbnMoLSkKCgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
