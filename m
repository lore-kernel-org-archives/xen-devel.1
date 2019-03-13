From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 09:22:59 -0600
Message-ID: <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h45ii-0005Iz-FJ
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 15:23:04 +0000
In-Reply-To: <20190218113600.9540-10-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAyLjE5IGF0IDEyOjM2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaAo+IEBAIC0zMjEsMTAgKzMyMSw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdl
X2Zyb21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB2YWRkcl90IHZhLAo+ICAjZGVmaW5lIFNIQVJFRF9N
MlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkKPiAgI2RlZmluZSBTSEFSRURfTTJQKF9lKSAg
ICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKPiAgCj4gLS8qIFhlbiBhbHdheXMg
b3ducyBQMk0gb24gQVJNICovCj4gKy8qIFdlIGRvbid0IGhhdmUgYSBNMlAgb24gQXJtICovCj4g
ICNkZWZpbmUgc2V0X2dwZm5fZnJvbV9tZm4obWZuLCBwZm4pIGRvIHsgKHZvaWQpIChtZm4pLCAo
dm9pZCkocGZuKTsgfSB3aGlsZSAoMCkKPiAtI2RlZmluZSBtZm5fdG9fZ21mbihfZCwgbWZuKSAg
KG1mbikKClNvIGlzIHRoZSBwbGFuIHRvIHJlbW92ZSB0aGUgb3RoZXIgbWFjcm8gZnJvbSBBcm0g
dGhlbiBhcyB3ZWxsPwpJbiBhbnkgZXZlbnQKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
