From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH for-4.11] tools: set DEBUG_DIR from configure
Date: Wed, 28 Mar 2018 11:27:36 -0500
Message-ID: <34a6e806-2cdd-3d3f-fbcc-f7c0554d2674@cardoe.com>
References: <20180327161344.94634-1-roger.pau@citrix.com>
 <20180327161807.GD30726@aepfle.de>
 <20180327162057.leyxcnt7rw2m64xj@MacBook-Pro-de-Roger.local>
 <20180327162812.y553z7wb2pyoxiwu@MacBook-Pro-de-Roger.local>
 <096a0ae6-491d-2069-f40c-b758c2a15203@cardoe.com>
 <20180328072633.ulcm3mzggyt5kqxb@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=86in=gs=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1f1DvI-0003ni-7D
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 16:27:40 +0000
Received: by mail-yw0-x22d.google.com with SMTP id i187so987290ywd.10
 for <xen-devel@lists.xenproject.org>; Wed, 28 Mar 2018 09:27:38 -0700 (PDT)
In-Reply-To: <20180328072633.ulcm3mzggyt5kqxb@MacBook-Pro-de-Roger.local>
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

T24gMy8yOC8xOCAyOjI2IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFR1ZSwgTWFy
IDI3LCAyMDE4IGF0IDExOjU1OjM3QU0gLTA1MDAsIERvdWcgR29sZHN0ZWluIHdyb3RlOgo+PiBP
biAzLzI3LzE4IDExOjI4IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gT24gVHVlLCBN
YXIgMjcsIDIwMTggYXQgMDU6MjA6NTdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
Pj4+PiBPbiBUdWUsIE1hciAyNywgMjAxOCBhdCAwNjoxODowOFBNICswMjAwLCBPbGFmIEhlcmlu
ZyB3cm90ZToKPj4+Pj4gT24gVHVlLCBNYXIgMjcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+
Pj4KPj4+Pj4+ICtBQ19BUkdfV0lUSChbZGVidWdkaXJdLAo+Pj4+Pj4gKyAgICBBU19IRUxQX1NU
UklORyhbLS13aXRoLWRlYnVnZGlyPURJUl0sCj4+Pj4+PiArICAgIFtQYXRoIHRvIGRpcmVjdG9y
eSBmb3IgZGVidWcgc3ltYm9scy4gW1BSRUZJWC91c3IvbGliL2RlYnVnXV0pLAo+Pj4+Pj4gKyAg
ICBbZGVidWdkaXJfcGF0aD0kd2l0aHZhbF0sCj4+Pj4+PiArICAgIFtkZWJ1Z2Rpcl9wYXRoPSRw
cmVmaXgvdXNyL2xpYi9kZWJ1Z10pCj4+Pj4+Cj4+Pj4+IFdvdWxkIHRoYXQgY3JlYXRlIC91c3Iv
dXNyL2xpYi9kZWJ1ZyBwZXIgZGVmYXVsdD8KPj4+Pgo+Pj4+IE5vLCB0aGlzIHdvdWxkIGJlOiAv
dXNyL2xvY2FsL3Vzci9saWIvZGVidWcgYnkgZGVmYXVsdC4KPj4+Cj4+PiBXaGljaCBtYXliZSBz
aG91bGQgYmU6IC91c3IvbG9jYWwvbGliL2RlYnVnIGluc3RlYWQ/Cj4+Pgo+Pgo+PiBZb3Ugc2hv
dWxkIHVzZSAkcHJlZml4L2xpYi9kZWJ1ZyBieSBkZWZhdWx0LiBXaGljaCB3b3VsZCBjYXVzZSB0
aGlzIHRvCj4+IG1hcCBhcHByb3ByaWF0ZWx5LiBJZiB5b3UgaGF2ZSBsZXQncyBzYXkgL3Vzci9i
aW4vbHMgdGhlbiBieSBkZWZhdWx0IGl0Cj4+IHdvdWxkIGhhdmUgL3Vzci9saWIvZGVidWcvdXNy
L2Jpbi9scy5kZWJ1ZyBJZiB5b3UgaGF2ZQo+PiAvdXNyL2xvY2FsL2Jpbi9mb28gdGhlbiBpdCB3
b3VsZCBiZSAvdXNyL2xvY2FsL2RlYnVnL3Vzci9sb2NhbC9iaW4vZm9vLmRlYnVnCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gbGliLwo+Pgo+PiBB
c3N1bWluZyB0aGF0IGxzIHdhcyBidWlsdCB3aXRoIC4vY29uZmlndXJlIC0tcHJlZml4PS91c3Ig
YW5kIGZvbyB3YXMKPiAKPiBJIGd1ZXNzIHlvdSBtZWFuIC0tcHJlZml4PS8sIHVzaW5nIC91c3Ig
d291bGQgZ2VuZXJhdGUgL3Vzci91c3IvYmluL2xzCj4gQUZBSUNUPwo+IAo+IFdpbGwgc2VuZCB2
MiBzaG9ydGx5LCBob3BlZnVsbHkgdGhpcyB0aW1lIHRoZSBwYXRocyB3aWxsIGJlIHJpZ2h0IDop
Cj4gCj4gVGhhbmtzLCBSb2dlci4KPiAKCk5vLiBUaGUgZGVmYXVsdCBwcmVmaXggd2l0aCBhdXRv
Y29uZiBpcyAiL3Vzci9sb2NhbCIuIEJ1dCB3aGVuIExpbnV4CmRpc3Ryb3MgcGFja2FnZSB0aGlu
Z3MgdXAgdGhleSB1c2UgIi91c3IiLiBTZWU6Cmh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUv
YXV0b2NvbmYvbWFudWFsL2F1dG9jb25mLTIuNjkvaHRtbF9ub2RlL0RlZmF1bHQtUHJlZml4Lmh0
bWwKCi0tIApEb3VnIEdvbGRzdGVpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
