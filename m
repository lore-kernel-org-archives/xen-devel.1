From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Problems with qemu when building with --enable-githttp
Date: Mon, 1 Apr 2019 10:27:42 -0600
Message-ID: <CABfawhk_qq1xfQHwQPFAW4oJhaAQqjiECABfqKteUoO9zaRs5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6WXg=SD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hAznI-0001Xv-Np
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 16:28:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 4so62019wmf.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Apr 2019 09:28:19 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLApJJ20gdHJ5aW5nIHRvIGNvbXBpbGUgUkVMRUFTRS00LjEyLjAgYnJhbmNoIHdpdGgg
LS1lbmFibGUtZ2l0aHR0cCBvbiBhCm5ldHdvcmsgdGhhdCBibG9ja3Mgbm9ybWFsIGdpdCBhY2Nl
c3NlcyBhbmQgSSBlbmNvdW50ZXJlZCB0aGUKZm9sbG93aW5nIGZhaWx1cmVzOgoKZmF0YWw6IGNs
b25lIG9mICdnaXQ6Ly9naXQucWVtdS5vcmcvY2Fwc3RvbmUuZ2l0JyBpbnRvIHN1Ym1vZHVsZSBw
YXRoCicvZGF0YS9zcmMveGVuL3Rvb2xzL3FlbXUteGVuLWRpci1yZW1vdGUvY2Fwc3RvbmUnIGZh
aWxlZApGYWlsZWQgdG8gY2xvbmUgJ2NhcHN0b25lJy4gUmV0cnkgc2NoZWR1bGVkCkNsb25pbmcg
aW50byAnL2RhdGEvc3JjL3hlbi90b29scy9xZW11LXhlbi1kaXItcmVtb3RlL3VpL2tleWNvZGVt
YXBkYicuLi4KZmF0YWw6IHVuYWJsZSB0byBjb25uZWN0IHRvIGdpdC5xZW11Lm9yZzoKZ2l0LnFl
bXUub3JnWzA6IDE3Mi45OS42OS4xNjNdOiBlcnJubz1Db25uZWN0aW9uIHRpbWVkIG91dAoKZmF0
YWw6IGNsb25lIG9mICdnaXQ6Ly9naXQucWVtdS5vcmcva2V5Y29kZW1hcGRiLmdpdCcgaW50byBz
dWJtb2R1bGUKcGF0aCAnL2RhdGEvc3JjL3hlbi90b29scy9xZW11LXhlbi1kaXItcmVtb3RlL3Vp
L2tleWNvZGVtYXBkYicgZmFpbGVkCkZhaWxlZCB0byBjbG9uZSAndWkva2V5Y29kZW1hcGRiJy4g
UmV0cnkgc2NoZWR1bGVkCkNsb25pbmcgaW50byAnL2RhdGEvc3JjL3hlbi90b29scy9xZW11LXhl
bi1kaXItcmVtb3RlL2NhcHN0b25lJy4uLgpmYXRhbDogdW5hYmxlIHRvIGNvbm5lY3QgdG8gZ2l0
LnFlbXUub3JnOgpnaXQucWVtdS5vcmdbMDogMTcyLjk5LjY5LjE2M106IGVycm5vPUNvbm5lY3Rp
b24gdGltZWQgb3V0CgpBcmUgdGhlcmUgYW55IGtub3duIHdvcmthcm91bmRzIHRvIHRoYXQgb3Ig
ZG8gSSBoYXZlIHRvIGdvIGluIGFuZAptYW51YWxseSBhZGp1c3QgZWFjaCBzdWJtb2R1bGUgaW4g
cWVtdT8KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
