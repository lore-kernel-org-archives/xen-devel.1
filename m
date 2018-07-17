From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: enable building rombios with
 clang
Date: Tue, 17 Jul 2018 16:54:33 -0500
Message-ID: <20180717215433.dsp6oaikeyrd7dgn@MacBook-Pro.localdomain>
References: <20180717083935.25964-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l0ah=kb=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ffXvZ-0005iw-8j
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 21:54:37 +0000
Received: by mail-yb0-x241.google.com with SMTP id y11-v6so1042306ybm.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jul 2018 14:54:35 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180717083935.25964-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDk6Mzk6MzVBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBQcmV2aW91c2x5IGl0IGlzIGRpc2FibGVkIGJlY2F1c2UgdGhlIGVtYmVkZGVkIGlweGUgY2Fu
J3QgYmUgYnVpbHQKPiB3aXRoIGNsYW5nLiBOb3cgdGhhdCBpcHhlIGlzIHNwbGl0IG91dCB3ZSBj
YW4gdXNlIC0td2l0aC1zeXN0ZW0taXB4ZQo+IHRvIHdvcmsgYXJvdW5kIHRoZSBpc3N1ZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IERl
cGVuZHMgb24gdGhlIGlweGUgc2VyaWVzIGp1c3QgY29tbWl0dGVkLgo+IC0tLQo+ICBhdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRz
L2J1aWxkIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCj4gaW5kZXggMDU0MjI2YmQ3My4uNGRj
YWFiZjRiZCAxMDA3NTUKPiAtLS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKPiArKysgYi9h
dXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKPiBAQCAtMTYsOCArMTYsOCBAQCBjZmdhcmdzKz0oIi0t
ZW5hYmxlLWRvY3MiKQo+ICBpZiBbWyAiJHtDQ30iID09ICJjbGFuZyIgXV07IHRoZW4KPiAgICAg
ICMgU2VhQklPUyBjYW5ub3QgYmUgYnVpbHQgd2l0aCBjbGFuZwo+ICAgICAgY2ZnYXJncys9KCIt
LXdpdGgtc3lzdGVtLXNlYWJpb3M9L3Vzci9zaGFyZS9zZWFiaW9zL2Jpb3MuYmluIikKPiAtICAg
ICMgaVBYRSBjYW5ub3QgYmUgYnVpbHQgd2l0aCBjbGFuZyBzbyB3ZSBjYW5ub3QgYnVpbGQgcm9t
Ymlvcwo+IC0gICAgY2ZnYXJncys9KCItLWRpc2FibGUtcm9tYmlvcyIpCj4gKyAgICAjIGlQWEUg
Y2Fubm90IGJlIGJ1aWx0IHdpdGggY2xhbmcKPiArICAgIGNmZ2FyZ3MrPSgiLS13aXRoLXN5c3Rl
bS1pcHhlPS91c3Ivc2hhcmUvaXB4ZS9pcHhlLmJpbiIpCgpUaGlzIGZpbGUgZG9lc24ndCBleGlz
dCBvbiB0aGUgVWJ1bnR1IGNvbnRhaW5lcnMgSSd2ZSB0cmllZC4gRXZlbiBhZnRlcgppbnN0YWxs
aW5nIGlweGUgYW5kIGlweGUtcWVtdS4gV2hhdCBkaXN0cm8gcHJvdmlkZWQgaVBYRSBmaWxlIGNh
biB3ZQp1c2U/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
