From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 27/31] libxl_qmp: Implement
 libxl__qmp_insert_cdrom_ev
Date: Wed, 27 Jun 2018 17:10:47 +0100
Message-ID: <23347.46855.558462.650157@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-28-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYD1v-00087m-9e
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 16:10:51 +0000
In-Reply-To: <20180601143720.24637-28-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDI3LzMxXSBsaWJ4bF9xbXA6IEltcGxl
bWVudCBsaWJ4bF9fcW1wX2luc2VydF9jZHJvbV9ldiIpOgo+IFRoaXMgZnVuY3Rpb24gaXMgYSBy
ZWltcGxlbWVudGF0aW9uIG9mIGxpYnhsX19xbXBfaW5zZXJ0X2Nkcm9tKCkgYnV0IHRvIGJlCj4g
dXNlIHdpdGggbGlieGxfX2V2X3FtcC4KCk92ZXJhbGwsIEkgdGhpbmsgd2hhdCBJIGFtIG1pc3Np
bmcgaW4gbXVjaCBvZiB0aGlzIGlzIGEgaGlnaGx5LWZvcm1hbApkZXNjcmlwdGlvbiBvZiB0aGUg
c3RhdGVzIG9mIHRoZXNlIGFzeW5jaHJvbm91cyB0aGluZ3MsIGFuZCB0aGUKcGVybWl0dGVkIGNh
bGwgb3JkZXJzLCBldGMuICBMaWtlIGZvciBsaWJ4bF9ldl9GT08sIHdoaWNoIHlvdSBhcmUKdHJ5
aW5nIHRvIGZvbGxvdywgYnV0IGRvZXNuJ3QgcmVhbGx5IGZpdC4KCkkgYXBwcmVjaWF0ZSB0aGF0
IEkgbWF5IGJlIGFza2luZyBmb3IgYSBsb3Qgb2YgcmV3b3JrLiAgU29ycnkuCgpJIHRoaW5rIGJl
Zm9yZSB5b3UgZG8gYSBmdWxsIHJlc2VuZCwgaXQgd291bGQgYmUgd29ydGggd3JpdGluZyBvdXQg
dGhlCmludGVybmFsIGludGVyZmFjZXMgaW4gYSBmb3JtIHRoYXQgYWRkcmVzc2VzIHRoaXMgYXNw
ZWN0IG9mIG15IHJldmlldwooaWUsIHRoZSBwYXJ0IGluIGxpYnhsX2ludGVybmFsLmgpLgoKQWxz
byBteSBjb21tZW50cyBhYm91dCB3aGV0aGVyIHRoZSBidWZmZXIgcXVldWUgaXMgcmVhbGx5IG5l
ZWRlZC4KClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
