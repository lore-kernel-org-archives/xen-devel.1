From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PULL 16/16] configure: do_compiler: Dump some extra
 info under bash
Date: Thu, 26 Apr 2018 16:56:27 +0100
Message-ID: <1524758187-9351-17-git-send-email-ian.jackson@eu.citrix.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBjGR-0006p2-Mh
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 15:56:55 +0000
In-Reply-To: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Janosch Frank <frankja@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Kent R. Spillner" <kspillner@acm.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBtYWtlcyBpdCBtdWNoIGVhc2llciB0byBmaW5kIGEgcGFydGljdWxhciB0aGluZyBpbiBj
b25maWcubG9nLgoKV2UgaGF2ZSB0byB1c2UgdGhlICR7QkFTSF9MSU5FTk9bKl19IHN5bnRheCB3
aGljaCBpcyBhIHN5bnRheCBlcnJvciBpbgpvdGhlciBzaGVsbHMsIHNvIHRlc3Qgd2hhdCBzaGVs
bCB3ZSBhcmUgcnVubmluZyBhbmQgdXNlIGV2YWwuCgpUaGUgZXh0cmEgb3V0cHV0IGlzIG9ubHkg
cHJpbnRlZCBpZiBjb25maWd1cmUgaXMgcnVuIHdpdGggYmFzaC4gIE9uCnN5c3RlbXMgd2hlcmUg
L2Jpbi9zaCBpcyBub3QgYmFzaCwgaXQgaXMgbmVjZXNzYXJ5IHRvIHNheSBiYXNoCi4vY29uZmln
dXJlIHRvIGdldCB0aGUgZXh0cmEgZGVidWcgaW5mbyBpbiB0aGUgbG9nLgoKU3VnZ2VzdGVkLWJ5
OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CkNDOiBLZW50IFIuIFNwaWxsbmVyIDxrc3Bp
bGxuZXJAYWNtLm9yZz4KQ0M6IEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXgudm5ldC5pYm0u
Y29tPgpDQzogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+CkNDOiBQZXRlciBNYXlkZWxs
IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+CkNDOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPgpUZXN0ZWQtYnk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgotLS0K
IGNvbmZpZ3VyZSB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKaW5kZXggYWEzNWFlZi4uZjliYTllYSAx
MDA3NTUKLS0tIGEvY29uZmlndXJlCisrKyBiL2NvbmZpZ3VyZQpAQCAtNjAsNiArNjAsMTEgQEAg
ZG9fY29tcGlsZXIoKSB7CiAgICAgIyBpcyBjb21waWxlciBiaW5hcnkgdG8gZXhlY3V0ZS4KICAg
ICBsb2NhbCBjb21waWxlcj0iJDEiCiAgICAgc2hpZnQKKyAgICBpZiB0ZXN0IC1uICIkQkFTSF9W
RVJTSU9OIjsgdGhlbiBldmFsICcKKyAgICAgICAgZWNobyA+PmNvbmZpZy5sb2cgIgorZnVuY3M6
ICR7RlVOQ05BTUVbKl19CitsaW5lczogJHtCQVNIX0xJTkVOT1sqXX0iCisgICAgJzsgZmkKICAg
ICBlY2hvICRjb21waWxlciAiJEAiID4+IGNvbmZpZy5sb2cKICAgICAkY29tcGlsZXIgIiRAIiA+
PiBjb25maWcubG9nIDI+JjEgfHwgcmV0dXJuICQ/CiAgICAgIyBUZXN0IHBhc3NlZC4gSWYgdGhp
cyBpcyBhbiAtLWVuYWJsZS13ZXJyb3IgYnVpbGQsIHJlcnVuCi0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
