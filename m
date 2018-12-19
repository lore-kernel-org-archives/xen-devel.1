From: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [RFC PATCH 6/6] xc_version: add vm_event interface
 version
Date: Wed, 19 Dec 2018 20:52:09 +0200
Message-ID: <b1269ed5b2454c8fd3c373bc92201efe13fc8194.1545245243.git.ppircalabu@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bU4Y=O4=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1gZgx6-0005o3-KC
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 18:52:16 +0000
In-Reply-To: <cover.1545245243.git.ppircalabu@bitdefender.com>
In-Reply-To: <cover.1545245243.git.ppircalabu@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4KLS0tCiB0b29scy9saWJ4Yy94Y19wcml2YXRlLmMgICAgIHwgMyArKysKIHhlbi9jb21tb24v
a2VybmVsLmMgICAgICAgICAgfCAzICsrKwogeGVuL2luY2x1ZGUvcHVibGljL3ZlcnNpb24uaCB8
IDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhjL3hjX3ByaXZhdGUuYyBiL3Rvb2xzL2xpYnhjL3hjX3ByaXZhdGUuYwppbmRleCA5
MDk3NGQ1Li45Yjk4M2UwIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19wcml2YXRlLmMKKysr
IGIvdG9vbHMvbGlieGMveGNfcHJpdmF0ZS5jCkBAIC00OTcsNiArNDk3LDkgQEAgaW50IHhjX3Zl
cnNpb24oeGNfaW50ZXJmYWNlICp4Y2gsIGludCBjbWQsIHZvaWQgKmFyZykKICAgICAgICAgICAg
IEhZUEVSQ0FMTF9CT1VOQ0VfU0VUX0RJUihhcmcsIFhDX0hZUEVSQ0FMTF9CVUZGRVJfQk9VTkNF
X0JPVEgpOwogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KKyAgICBjYXNlIFhFTlZFUl92
bV9ldmVudF92ZXJzaW9uOgorICAgICAgICBzeiA9IDA7CisgICAgICAgIGJyZWFrOwogICAgIGRl
ZmF1bHQ6CiAgICAgICAgIEVSUk9SKCJ4Y192ZXJzaW9uOiB1bmtub3duIGNvbW1hbmQgJWRcbiIs
IGNtZCk7CiAgICAgICAgIHJldHVybiAtRUlOVkFMOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9r
ZXJuZWwuYyBiL3hlbi9jb21tb24va2VybmVsLmMKaW5kZXggNTc2NmEwZi4uNjY3NTUyYyAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYworKysgYi94ZW4vY29tbW9uL2tlcm5lbC5jCkBA
IC01MTYsNiArNTE2LDkgQEAgRE8oeGVuX3ZlcnNpb24pKGludCBjbWQsIFhFTl9HVUVTVF9IQU5E
TEVfUEFSQU0odm9pZCkgYXJnKQogCiAgICAgICAgIHJldHVybiBzejsKICAgICB9CisKKyAgICBj
YXNlIFhFTlZFUl92bV9ldmVudF92ZXJzaW9uOgorICAgICAgICByZXR1cm4gVk1fRVZFTlRfSU5U
RVJGQUNFX1ZFUlNJT047CiAgICAgfQogCiAgICAgcmV0dXJuIC1FTk9TWVM7CmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9wdWJsaWMvdmVyc2lvbi5oIGIveGVuL2luY2x1ZGUvcHVibGljL3ZlcnNp
b24uaAppbmRleCA3MDYzZThjLi5iOTYyMzg2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJs
aWMvdmVyc2lvbi5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92ZXJzaW9uLmgKQEAgLTEwMyw2
ICsxMDMsOSBAQCBzdHJ1Y3QgeGVuX2J1aWxkX2lkIHsKIH07CiB0eXBlZGVmIHN0cnVjdCB4ZW5f
YnVpbGRfaWQgeGVuX2J1aWxkX2lkX3Q7CiAKKy8qIGFyZyA9PSBOVUxMOyByZXR1cm5zIHRoZSB2
bV9ldmVudCBpbnRlcmZhY2UgdmVyc2lvbiAqLworI2RlZmluZSBYRU5WRVJfdm1fZXZlbnRfdmVy
c2lvbiAxMQorCiAjZW5kaWYgLyogX19YRU5fUFVCTElDX1ZFUlNJT05fSF9fICovCiAKIC8qCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
