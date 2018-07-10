From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/3] xl/libxl: fixes for vsnd
Date: Tue, 10 Jul 2018 14:46:04 +0100
Message-ID: <20180710134607.20302-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9fb0=j2=citrix.com=prvs=7221156ca=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcsy4-0006Os-SO
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:46:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, al1img@gmail.com, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMyk6CiAgbGlieGwvdnNuZDogYWRkIG1pc3NpbmcgZXJyb3IgY2hlY2tzCiAgeGwv
dnNuZDogdXNlIHhjYWxsb2MgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBwYXJzZXIKICB4bC92c25k
OiBpbml0aWFsaXNlIHJjIGluIGRyeXJ1biBwYXRoCgogdG9vbHMvbGlieGwvbGlieGxfdnNuZC5j
IHwgIDIgKysKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICB8IDEyICsrKysrKy0tLS0tLQogdG9v
bHMveGwveGxfdnNuZC5jICAgICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
