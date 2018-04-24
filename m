From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup:
 Replace perror with error_report
Date: Tue, 24 Apr 2018 15:53:48 +0100
Message-ID: <23263.17660.17771.980752@mariner.uk.xensource.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvks=hn=citrix.com=prvs=6454bde7c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fAzKL-0005vL-IN
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 14:53:53 +0000
In-Reply-To: <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JpdGVzICgiUmU6IFtRZW11LWRldmVsXSBbUEFUQ0gg
MTUvMTZdIG9zLXBvc2l4OiBjbGVhbnVwOiBSZXBsYWNlIHBlcnJvciB3aXRoIGVycm9yX3JlcG9y
dCIpOgo+IE9uIDA0LzE5LzIwMTggMDE6NDUgUE0sIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gLSAg
ICAgICAgcGVycm9yKCJtbG9ja2FsbCIpOwo+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJtbG9j
a2FsbDogJXMiLCBzdHJlcnJvcihlcnJubykpOwo+ID4gICAgICB9Cj4gPiAgCj4gPiAgICAgIHJl
dHVybiByZXQ7Cj4gCj4gVGhpbmtpbmcgbG91ZGx5LCBtYXliZSB3ZSBjYW4gcmVmYWN0b3IgYXMg
ZXJyb3JfcmVwb3J0X2Vycm5vKGNvbnN0IGNoYXIKPiAqZGVzYykuLi4KCmdpdC1ncmVwICdlcnJv
cl9yZXBvcnQuKmVycm5vJyBzaG93cyBhIGxvdCBvZiBjYWxsIHNpdGVzIHRoYXQgZG8Kc29tZXRo
aW5nIG1vcmUgZXhjaXRpbmcgdGhhbiBjb25zdCBjaGFyICpkZXNjIHdvdWxkIHN1cHBvcnQuCgpJ
IHRoaW5rIHRoZSByaWdodCBhcHByb2FjaCB3b3VsZCBiZQoKIC0gc3RhdGljIHZvaWQgdnJlcG9y
dChyZXBvcnRfdHlwZSB0eXBlLCBjb25zdCBjaGFyICpmbXQsIHZhX2xpc3QgYXApCiArIHN0YXRp
YyB2b2lkIHZyZXBvcnQocmVwb3J0X3R5cGUgdHlwZSwgaW50IGVycm5vdmFsLCBjb25zdCBjaGFy
ICpmbXQsIHZhX2xpc3QgYXApCi4uLgogKyAgICAgaWYgKGVycm5vdmFsID49IDApIHsKICsgICAg
ICAgICBlcnJvcl9wcmludGYoIjogJXMiLCBzdHJlcnJvcihlcnJub3ZhbCk7CiArICAgICB9Cgph
bmQgdGhlbiBhZGQgYm90aAogIGVycm9yX3JlcG9ydF9lcnJubwogIGVycm9yX3ZyZXBvcnRfZXJy
bm8Kd2l0aCB0aGUgb2J2aW91cyBzZW1hbnRpY3MuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
