From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH for-4.11] tools: set DEBUG_DIR from configure
Date: Tue, 27 Mar 2018 11:55:37 -0500
Message-ID: <096a0ae6-491d-2069-f40c-b758c2a15203@cardoe.com>
References: <20180327161344.94634-1-roger.pau@citrix.com>
 <20180327161807.GD30726@aepfle.de>
 <20180327162057.leyxcnt7rw2m64xj@MacBook-Pro-de-Roger.local>
 <20180327162812.y553z7wb2pyoxiwu@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kgvd=gr=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1f0rst-0006rm-2R
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 16:55:43 +0000
Received: by mail-qk0-x22b.google.com with SMTP id w6so22997240qkb.4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Mar 2018 09:55:40 -0700 (PDT)
In-Reply-To: <20180327162812.y553z7wb2pyoxiwu@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8yNy8xOCAxMToyOCBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIE1h
ciAyNywgMjAxOCBhdCAwNToyMDo1N1BNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
PiBPbiBUdWUsIE1hciAyNywgMjAxOCBhdCAwNjoxODowOFBNICswMjAwLCBPbGFmIEhlcmluZyB3
cm90ZToKPj4+IE9uIFR1ZSwgTWFyIDI3LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pgo+Pj4+
ICtBQ19BUkdfV0lUSChbZGVidWdkaXJdLAo+Pj4+ICsgICAgQVNfSEVMUF9TVFJJTkcoWy0td2l0
aC1kZWJ1Z2Rpcj1ESVJdLAo+Pj4+ICsgICAgW1BhdGggdG8gZGlyZWN0b3J5IGZvciBkZWJ1ZyBz
eW1ib2xzLiBbUFJFRklYL3Vzci9saWIvZGVidWddXSksCj4+Pj4gKyAgICBbZGVidWdkaXJfcGF0
aD0kd2l0aHZhbF0sCj4+Pj4gKyAgICBbZGVidWdkaXJfcGF0aD0kcHJlZml4L3Vzci9saWIvZGVi
dWddKQo+Pj4KPj4+IFdvdWxkIHRoYXQgY3JlYXRlIC91c3IvdXNyL2xpYi9kZWJ1ZyBwZXIgZGVm
YXVsdD8KPj4KPj4gTm8sIHRoaXMgd291bGQgYmU6IC91c3IvbG9jYWwvdXNyL2xpYi9kZWJ1ZyBi
eSBkZWZhdWx0Lgo+IAo+IFdoaWNoIG1heWJlIHNob3VsZCBiZTogL3Vzci9sb2NhbC9saWIvZGVi
dWcgaW5zdGVhZD8KPiAKCllvdSBzaG91bGQgdXNlICRwcmVmaXgvbGliL2RlYnVnIGJ5IGRlZmF1
bHQuIFdoaWNoIHdvdWxkIGNhdXNlIHRoaXMgdG8KbWFwIGFwcHJvcHJpYXRlbHkuIElmIHlvdSBo
YXZlIGxldCdzIHNheSAvdXNyL2Jpbi9scyB0aGVuIGJ5IGRlZmF1bHQgaXQKd291bGQgaGF2ZSAv
dXNyL2xpYi9kZWJ1Zy91c3IvYmluL2xzLmRlYnVnIElmIHlvdSBoYXZlCi91c3IvbG9jYWwvYmlu
L2ZvbyB0aGVuIGl0IHdvdWxkIGJlIC91c3IvbG9jYWwvZGVidWcvdXNyL2xvY2FsL2Jpbi9mb28u
ZGVidWcKCkFzc3VtaW5nIHRoYXQgbHMgd2FzIGJ1aWx0IHdpdGggLi9jb25maWd1cmUgLS1wcmVm
aXg9L3VzciBhbmQgZm9vIHdhcwpidWlsdCB3aXRoIC4vY29uZmlndXJlICh3aGVyZSAtLXByZWZp
eCBpcyBieSBkZWZhdWx0IC91c3IvbG9jYWwpLgoKLS0gCkRvdWcgR29sZHN0ZWluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
