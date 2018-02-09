From: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Subject: Re: [PATCH 1/7] xen/arm: vpsci: Remove parameter 'ver'
 from do_common_cpu
Date: Fri, 9 Feb 2018 14:36:49 +0200
Message-ID: <CAOcqxo1ES3Lk1Z_2EQAmkb=PWmZyM2LELB5xhjSS1e6YR1pEpQ@mail.gmail.com>
References: <20180205132011.27996-1-julien.grall@arm.com>
 <20180205132011.27996-2-julien.grall@arm.com>
 <CAOcqxo0JwQp5RbHPUc+sCUdCwyDmSzzgXa33b7f7zd=m1JVUMg@mail.gmail.com>
 <8207b584-a833-3b95-e373-334d9bb52ed1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8207b584-a833-3b95-e373-334d9bb52ed1@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKT24gOCBGZWJydWFyeSAyMDE4IGF0IDIwOjEyLCBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKCkN1cnJlbnRseSwgdGhlIGJlaGF2aW9yIG9mIGRv
X2NvbW1vbl9jcHUgd2lsbCBzbGlnaHRseSBjaGFuZ2UgZGVwZW5kaW5nCj4+PiBvbiB0aGUgUFND
SSB2ZXJzaW9uIHBhc3NlZCBpbiBwYXJhbWV0ZXIuIExvb2tpbmcgYXQgdGhlIGNvZGUsIG1vcmUg
dGhlCj4+PiBzcGVjaWZpYyAwLjIgYmVoYXZpb3IgY291bGQgbW92ZSBvdXQgb2YgdGhlIGZ1bmN0
aW9uIG9yIGFkYXB0ZWQgZm9yIDAuMToKPj4+Cj4+PiAgICAgIC0geDAvcjAgY2FuIGJlIHVwZGF0
ZWQgb24gUFNDSSAwLjEgYmVjYXVzZSBnZW5lcmFsIHB1cnBvc2UgcmVnaXN0ZXJzCj4+PiAgICAg
IGFyZSB1bmRlZmluZWQgdXBvbiBDUFUgb24uCj4+PiAgICAgIC0gUFNDSSAwLjEgZG9lcyBub3Qg
ZGVmaW5lZCBQU0NJX0FMUkVBRFlfT04uIEhvd2V2ZXIsIGl0IHdvdWxkIGJlCj4+PiAgICAgIHNh
ZmVyIHRvIGJhaWwgb3V0IGlmIHRoZSBDUFUgaXMgYWxyZWFkeSBvbi4KPj4+Cj4+PiBCYXNlZCBv
biB0aGlzLCB0aGUgcGFyYW1ldGVyICd2ZXInIGlzIHJlbW92ZWQgYW5kIGRvX3BzY2lfY3B1X29u
Cj4+PiAoaW1wbGVtZW50YXRpb24gZm9yIFBTQ0kgMC4xKSBpcyBhZGFwdGVkIHRvIGF2b2lkIHJl
dHVybmluZwo+Pj4gUFNDSV9BTFJFQURZX09OLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBWb2xvZHlt
eXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4KPgo+IFRoYW5rIHlvdSBm
b3IgdGhlIHJldmlld2VkLiBGSVksIEkgbW92ZWQgdGhhdCBwYXRjaCB0b3dhcmRzIHRoZSBlbmQg
b2YgdGhlCj4gc2VyaWVzIGFzIGl0IGlzIG5vdCBuZWNlc3NhcnkgZm9yIGJhY2twb3J0aW5nLiBJ
IGtlcHQgeW91ciByZXZpZXdlZC1ieQo+IGJlY2F1c2UgdGhlcmUgYXJlIG5vIGNsYXNoLgo+Cj4g
SSBob3BlIHRoYXQgaXMgZmluZSBmb3IgeW91LgpZZXMsIEknbSBwZXJmZWN0bHkgZmluZSB3aXRo
IHRoaXMuCgoKLS0gCldCUiBWb2xvZHlteXIgQmFiY2h1ayBha2EgbG9yYyBbKzM4MDk3NjY0NjAx
M10KbWFpbHRvOiB2bGFkLmJhYmNodWtAZ21haWwuY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
