From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libx86: Work around GCC bug with ebx output
 constrants
Date: Mon, 19 Nov 2018 07:38:19 -0700
Message-ID: <5BF2CADB02000078001FD83F@prv1-mh.provo.novell.com>
References: <1542633088-11101-1-git-send-email-andrew.cooper3@citrix.com>
 <5BF2BFDE02000078001FD7D2@prv1-mh.provo.novell.com>
 <b4d259ec-0d51-ac29-4341-a94bd78163ef@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b4d259ec-0d51-ac29-4341-a94bd78163ef@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjExLjE4IGF0IDE1OjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTEvMjAxOCAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAgc3RhdGlj
IGlubGluZSB2b2lkIGNwdWlkX2xlYWYodWludDMyX3QgbGVhZiwgc3RydWN0IGNwdWlkX2xlYWYg
KmwpCj4+PiAgewo+Pj4gLSAgICBhc20gKCAiY3B1aWQiCj4+PiAtICAgICAgICAgIDogIj1hIiAo
bC0+YSksICI9YiIgKGwtPmIpLCAiPWMiIChsLT5jKSwgIj1kIiAobC0+ZCkKPj4+ICsgICAgYXNt
ICggWENIR19CWAo+Pj4gKyAgICAgICAgICAiY3B1aWQ7Igo+Pj4gKyAgICAgICAgICBYQ0hHX0JY
Cj4+PiArICAgICAgICAgIDogIj1hIiAobC0+YSksIEJYX0NPTiAobC0+YiksICI9YyIgKGwtPmMp
LCAiPWQiIChsLT5kKQo+PiBTdHJpY3RseSBzcGVha2luZyBhbGwgb3RoZXIgb3V0cHV0cyBhbHNv
IG5lZWQgdG8gdXNlID0mIGluIHRoZQo+PiAzMi1iaXQgY2FzZS4gQnV0IEkgd291bGRuJ3QgaW5z
aXN0IG9uIHN1Y2ggYW4gYWRqdXN0bWVudC4gV2l0aAo+PiB0aGUgb3RoZXJzIGRvbmUKPj4gUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBVc2luZyA9JiBm
b3IgdGhlIGNvbnN0cmFpbnRzIHdoaWNoIGFsc28gaGF2ZSBpbnB1dHMgcmVzdWx0cyAib3BlcmFu
ZCBoYXMKPiBpbXBvc3NpYmxlIGNvbnN0cmFpbnRzIgoKWWVzLCBJIGhhZCAoc2lsZW50bHkpIGFz
c3VtZWQgdGhpcyB3b3VsZCBiZSB0aGUgY2FzZS4KCj4gSXQgc2hvdWxkIG9ubHkgbWF0dGVyIGZv
ciB0aGUgb3V0cHV0LW9ubHkgb3BlcmFuZHMsIHRvIHByZXZlbnQgR0NDCj4gYWxsb2NhdGluZyAl
W2VyXWR4IGZvciB0aGUgYnggY29uc3RyYWludCwgYnV0IHRoYXQgc2hvdWxkbid0IG1hdHRlcgo+
IGFueXdheSBiZWNhdXNlID0mciBjYW4ndCBiZSBhbGxvY2F0ZWQgdG8gY29uZmxpY3Qgd2l0aCA9
ZAoKSGVuY2UgbWUgaGF2aW5nIHNhaWQgInN0cmljdGx5IHNwZWFraW5nIi4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
