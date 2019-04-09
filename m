From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen/cameraif: add ABI for para-virtual
 camera
Date: Tue, 9 Apr 2019 12:18:06 +0300
Message-ID: <fc116cfb-833e-e734-fcb4-4f93bd9371b4__13367.413699028$1554801549$gmane$org@gmail.com>
References: <20190409091546.9606-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PY99=SL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDmtP-0004Fl-0D
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:18:11 +0000
Received: by mail-lj1-x244.google.com with SMTP id f23so13837745ljc.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 02:18:09 -0700 (PDT)
In-Reply-To: <20190409091546.9606-1-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, konrad.wilk@oracle.com, jgross@suse.com, hverkuil@xs4all.nl, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIGlzIHRoZSBzeW5jIHVwIHdpdGggdGhlIGNhbWVyYSBwcm90b2NvbCBkZWZp
bml0aW9uIGluIFhlbgoKT24gNC85LzE5IDEyOjE1IFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+Cj4KPiBUaGlzIGlzIHRoZSBBQkkgZm9yIHRoZSB0d28gaGFsdmVz
IG9mIGEgcGFyYS12aXJ0dWFsaXplZAo+IGNhbWVyYSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4n
cyByZWFjaCBtdWx0aW1lZGlhIGNhcGFiaWxpdGllcyBldmVuCj4gZnVydGhlciBlbmFibGluZyBp
dCBmb3IgdmlkZW8gY29uZmVyZW5jaW5nLCBJbi1WZWhpY2xlIEluZm90YWlubWVudCwKPiBoaWdo
IGRlZmluaXRpb24gbWFwcyBldGMuCj4KPiBUaGUgaW5pdGlhbCBnb2FsIGlzIHRvIHN1cHBvcnQg
bW9zdCBuZWVkZWQgZnVuY3Rpb25hbGl0eSB3aXRoIHRoZQo+IGZpbmFsIGlkZWEgdG8gbWFrZSBp
dCBwb3NzaWJsZSB0byBleHRlbmQgdGhlIHByb3RvY29sIGlmIG5lZWQgYmU6Cj4KPiAxLiBQcm92
aWRlIG1lYW5zIGZvciBiYXNlIHZpcnR1YWwgZGV2aWNlIGNvbmZpZ3VyYXRpb246Cj4gICAtIHBp
eGVsIGZvcm1hdHMKPiAgIC0gcmVzb2x1dGlvbnMKPiAgIC0gZnJhbWUgcmF0ZXMKPiAyLiBTdXBw
b3J0IGJhc2ljIGNhbWVyYSBjb250cm9sczoKPiAgIC0gY29udHJhc3QKPiAgIC0gYnJpZ2h0bmVz
cwo+ICAgLSBodWUKPiAgIC0gc2F0dXJhdGlvbgo+IDMuIFN1cHBvcnQgc3RyZWFtaW5nIGNvbnRy
b2wKPgo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
Cj4gQ2M6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgo+IC0tLQo+ICAgaW5jbHVk
ZS94ZW4vaW50ZXJmYWNlL2lvL2NhbWVyYWlmLmggfCAxMzY1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzNjUgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby9jYW1lcmFpZi5oCj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
