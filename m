From: Jason Long <hack3rcon@yahoo.com>
Subject: Re: Xen or Bhyve?
Date: Fri, 8 Jun 2018 10:19:40 +0000 (UTC)
Message-ID: <680569052.2276964.1528453180932@mail.yahoo.com>
References: <680569052.2276964.1528453180932.ref@mail.yahoo.com>
Reply-To: Jason Long <hack3rcon@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dqhi=i2=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1fREUi-0008Rr-R2
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 10:19:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jason Long' <hack3rcon@yahoo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q2FuIHlvdSB0ZWxsIHdoZXJlIEkgY2FuIGFzayBpdD8KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KT24gRnJpLCA2LzgvMTgsIFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgoKIFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBYZW4g
b3IgQmh5dmU/CiBUbzogIidKYXNvbiBMb25nJyIgPGhhY2szcmNvbkB5YWhvby5jb20+LCAieGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIiA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPgogRGF0ZTogRnJpZGF5LCBKdW5lIDgsIDIwMTgsIDg6NDIgQU0KIAogPiAtLS0tLU9yaWdp
bmFsCiBNZXNzYWdlLS0tLS0KID4gRnJvbTogWGVuLWRldmVsIFttYWlsdG86eGVuLWRldmVsLWJv
dW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddCiBPbiBCZWhhbGYKID4gT2YgSmFzb24gTG9uZwog
PiBTZW50OiAwNyBKdW5lIDIwMTggMTk6MTAKID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwogPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBYZW4gb3IgQmh5dmU/CiA+IAogPiBIZWxs
by4KID4gRm9yIEJTRCBkaXN0cm9zLCBYZW4gaXMgYmV0dGVyIG9yIEJoeXZlPwogQ2FuIEJoeXZl
IGJlIGEgcmVwbGFjZW1lbnQgZm9yCiA+IFhlbj8KIEhhdmUgQmh5dmUgYWxsIFhlbiBmZWF0dXJl
cz8KID4gCiAKIFRoaXMgaXMgbm90IHJlYWxseSBhbgogYXBwcm9wcmlhdGUgbGlzdCBmb3Igc3Vj
aCBhIHF1ZXN0aW9uLiBTZWUgaHR0cHM6Ly93aWtpLnhlbi5vcmcvd2lraS9Bc2tpbmdfRGV2ZWxv
cGVyX1F1ZXN0aW9ucwogZm9yIG1vcmUgaW5mb3JtYXRpb24uCiAKIMKgIFBhdWwKIAogPiAKID4g
VGhhbmsgeW91LgogPiAKID4KIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCiA+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKID4gWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWwKIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0CiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
