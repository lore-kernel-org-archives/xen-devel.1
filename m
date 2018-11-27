From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v1 1/2] system_state: introduce
 SYS_STATE_smp_booted
Date: Tue, 27 Nov 2018 11:00:28 +0000
Message-ID: <b29dc36d-32c6-992d-b644-fa584789ce83@citrix.com>
References: <20181127100034.4257-1-sergey.dyasli@citrix.com>
 <20181127100034.4257-2-sergey.dyasli@citrix.com>
 <5BFD1AE10200007800200483@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BFD1AE10200007800200483@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMTEuMTgg
YXQgMTE6MDAsIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBUaGUgbmV3IHN0
YXRlIG1lYW5zIHRoYXQgYWxsIHNlY29uZGFyeSBDUFVzIGFyZSB1cC4gT24geDg2IHRoaXMgYWxz
bwo+PiBtZWFucyB0aGF0IGEgbWljcm9jb2RlIHdhcyAocG90ZW50aWFsbHkpIHVwZGF0ZWQgb24g
YWxsIENQVXMuCj4gCj4gSSdtIHNsaWdodGx5IGNvbmNlcm5lZCBieSBzdWNoIGFuIHg4NiBzcGVj
aWZpYzogQ291bGQgd2Ugc2V0dGxlIG9uCj4gYSBtb3JlIGdlbmVyaWMgZGVzY3JpcHRpb24gb2Yg
dGhlIHN0YXRlIGFsbCBDUFVzIGFyZSBpbiBhdCB0aGF0Cj4gcG9pbnQsIGxpa2UgImZ1bGx5IGZ1
bmN0aW9uYWwiLCBhbmQgb25seSBnaXZlIHVjb2RlIGxvYWRpbmcgb24geDg2Cj4gYXMgYW4gZXhh
bXBsZT8KCkFjY29yZGluZyB0byBKdWxpZW4ncyBjb21tZW50LCBJIG5lZWQgdG8gbWFrZSB0aGlz
IGZpeCB0byBiZSB4ODYgb25seS4KU28gSSBwbGFuIHRvIGludHJvZHVjZSBzb21ldGhpbmcgbGlr
ZSAiYm9vbCBzdXNwZW5kX2lkbGVfc2NydWIiIGluc3RlYWQuCgo+PiBAQCAtOTMwLDYgKzkzMiw4
IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQs
Cj4+ICAgICAgcHJpbnRrKCJCcm91Z2h0IHVwICVsZCBDUFVzXG4iLCAobG9uZyludW1fb25saW5l
X2NwdXMoKSk7Cj4+ICAgICAgLyogVE9ETzogc21wX2NwdXNfZG9uZSgpOyAqLwo+PiAgCj4+ICsg
ICAgc3lzdGVtX3N0YXRlID0gU1lTX1NUQVRFX3NtcF9ib290ZWQ7Cj4gCj4gVGhlIHBsYWNlbWVu
dCBoZXJlIGFuZCAuLi4KPiAKPj4gLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKPj4gKysrIGIv
eGVuL2FyY2gveDg2L3NldHVwLmMKPj4gQEAgLTE2ODMsNiArMTY4Myw4IEBAIHZvaWQgX19pbml0
IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4+ICAgICAgICAgIH0K
Pj4gICAgICB9Cj4+ICAKPj4gKyAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfc21wX2Jvb3Rl
ZDsKPj4gKwo+PiAgICAgIHByaW50aygiQnJvdWdodCB1cCAlbGQgQ1BVc1xuIiwgKGxvbmcpbnVt
X29ubGluZV9jcHVzKCkpOwo+PiAgICAgIGlmICggbnVtX3BhcmtlZCApCj4+ICAgICAgICAgIHBy
aW50ayhYRU5MT0dfSU5GTyAiUGFya2VkICV1IENQVXNcbiIsIG51bV9wYXJrZWQpOwo+IAo+IC4u
LiBoZXJlIGRpZmZlciB3cnQgdGhlIHByaW50aygpcyAtIGlzIHRoaXMgaW50ZW50aW9uYWwsIGFu
ZCBpZiBzbyB3aHk/CgpUaGlzIHdhcyBub3QgaW50ZW50aW9uYWwsIGJ1dCBpdCBoYXJkbHkgbWF0
dGVycyBub3cuCgotLQpUaGFua3MsClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
