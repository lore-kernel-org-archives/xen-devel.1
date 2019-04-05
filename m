From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86/cpu: Drop cpu_devs[] and
 $VENDOR_init_cpu() hooks
Date: Fri, 05 Apr 2019 02:57:41 -0600
Message-ID: <5CA718850200007800224CC8@prv1-mh.provo.novell.com>
References: <1554409592-28572-1-git-send-email-andrew.cooper3@citrix.com>
 <1554409592-28572-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554409592-28572-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Pu Wen <puwen@hygon.cn>, Davidwang <Davidwang@zhaoxin.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE5IGF0IDIyOjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlc2UgaGVscGVycyBlYWNoIGZpbGwgaW4gYSBzaW5nbGUgY3B1X2RldnNbXSBwb2lu
dGVyLCBhbmQgc2luY2UgYy9zCj4gMDBiNGY0ZDBmICJ4ODYvY3B1aWQ6IERyb3AgZ2V0X2NwdV92
ZW5kb3IoKSBjb21wbGV0ZWx5IiwgdGhpcyBhcnJheSBpcyByZWFkCj4gZXhhY3RseSBvbmNlIG9u
IGJvb3QuCj4gCj4gRGVsZXRlIHRoZSBob29rcyBhbmQgY3B1X2RldnNbXSwgYW5kIGhhdmUgZWFy
bHlfY3B1X2RldGVjdCgpIHBpY2sgdGhlCj4gYXBwcm9wcmlhdGUgY3B1X2RldiBzdHJ1Y3R1cmUg
ZGlyZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CndpdGggb25lIHJlbWFyazoKCj4gQEAgLTY4NywxMCArNjg5LDYgQEAgc3RhdGljIGNwdW1h
c2tfdCBjcHVfaW5pdGlhbGl6ZWQ7Cj4gIAo+ICB2b2lkIF9faW5pdCBlYXJseV9jcHVfaW5pdCh2
b2lkKQo+ICB7Cj4gLQlpbnRlbF9jcHVfaW5pdCgpOwo+IC0JYW1kX2luaXRfY3B1KCk7Cj4gLQlj
ZW50YXVyX2luaXRfY3B1KCk7Cj4gLQlzaGFuZ2hhaV9pbml0X2NwdSgpOwo+ICAJZWFybHlfY3B1
X2RldGVjdCgpOwo+ICB9CgpJIHRoaW5rIHRoaXMgZnVuY3Rpb24gc2hvdWxkIHRoZW4gZ28gYXdh
eSBhcyB3ZWxsLCB1bmxlc3MgeW91IGhhdmUKcGxhbnMgdG8gcHV0IG5ldyBzdHVmZiBpbnRvIGl0
LiBUbyBhdm9pZCBtb2RpZnlpbmcgdGhlIGNhbGxlciwKcGVyaGFwcyBiZXN0IHRvIHNpbXBseSBy
ZW5hbWVkIGVhcmx5X2NwdV9kZXRlY3QoKT8gTXkgUi1iCnN0YW5kcyB3aXRoIHRoaXMgY2hhbmdl
LCBpZiB5b3UgZGVjaWRlIHRvIGZvbGQgaXQgaW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
