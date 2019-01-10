From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Re: [PATCH v3 03/15] argo: define argo_dprintk for
 subsystem debugging
Date: Thu, 10 Jan 2019 10:28:39 +0100
Message-ID: <CAPLaKK6G-kRu0z2kXwJgv3=4hu-Zaup_Dxe9OrmMHZ3mHdx7jA@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-4-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5H7G=PS=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1ghWdx-0002p0-DK
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 09:28:53 +0000
Received: by mail-oi1-f196.google.com with SMTP id m6so8714221oig.11
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 01:28:51 -0800 (PST)
In-Reply-To: <1546846968-7372-4-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gNywgMjAxOSBhdCA4OjQzIEFNIENocmlzdG9waGVyIENsYXJrCjxjaHJpc3Rv
cGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBIGNvbnZlbmllbmNlIGZvciB3b3Jr
aW5nIG9uIGRldmVsb3BtZW50IG9mIHRoZSBhcmdvIHN1YnN5c3RlbToKPiBzZXR0aW5nIGEgI2Rl
ZmluZSB2YXJpYWJsZSBlbmFibGVzIGFkZGl0aW9uYWwgZGVidWcgbWVzc2FnZXMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3Rl
bXMuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgoKPiAtLS0KPiB2MiAjMDMgZmVlZGJhY2ssIEphbjogZml4IGlmZGVmL2RlZmluZSBjb25m
dXNpb24gZXJyb3IKPiB2MSAjMDQgZmVlZGJhY2ssIEphbjogZml4IGRwcmludGsgaW1wbGVtZW50
YXRpb24KPgo+ICB4ZW4vY29tbW9uL2FyZ28uYyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2FyZ28uYyBi
L3hlbi9jb21tb24vYXJnby5jCj4gaW5kZXggZDY5YWQ3Yy4uNmY3ODJmNyAxMDA2NDQKPiAtLS0g
YS94ZW4vY29tbW9uL2FyZ28uYwo+ICsrKyBiL3hlbi9jb21tb24vYXJnby5jCj4gQEAgLTE5LDYg
KzE5LDE1IEBACj4gICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4KPiAgI2luY2x1ZGUgPHhlbi9ndWVz
dF9hY2Nlc3MuaD4KPgo+ICsvKiBDaGFuZ2UgdGhpcyB0byAjZGVmaW5lIEFSR09fREVCVUcgaGVy
ZSB0byBlbmFibGUgbW9yZSBkZWJ1ZyBtZXNzYWdlcyAqLwo+ICsjdW5kZWYgQVJHT19ERUJVRwo+
ICsKPiArI2lmZGVmIEFSR09fREVCVUcKPiArI2RlZmluZSBhcmdvX2RwcmludGsoZm9ybWF0LCBh
cmdzLi4uKSBwcmludGsoImFyZ286ICIgZm9ybWF0LCAjIyBhcmdzICkKCkkgd291bGQgbWF5YmUg
Y29uc2lkZXIgcHJlZml4aW5nIHRoaXMgd2l0aCBYRU5MT0dfREVCVUcsIGJ1dCBzaW5jZQppdCdz
IGEgaGlkZGVuIGNvbXBpbGUtdGltZSBkZWJ1ZyBJJ20gbm90IHN1cmUgaXQncyByZWxldmFudCB0
byBzZXQgdGhlCmxvZyBsZXZlbC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
