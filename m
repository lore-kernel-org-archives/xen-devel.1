From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/2] xen-netfront: Fix issues with commit
 f599c64fdf7d
Date: Thu, 21 Jun 2018 14:00:19 +0100
Message-ID: <20180621130021.27029-1-ross.lagerwall__34816.6932272308$1529585981$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=evb4=jh=citrix.com=prvs=70385fc13=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1fVzCX-0004qj-5D
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 13:00:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: netdev@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "David S.
 Miller" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

Rml4IGEgY291cGxlIG9mIGlzc3VlcyB3aXRoIGNvbW1pdCBmNTk5YzY0ZmRmN2QgKCJ4ZW4tbmV0
ZnJvbnQ6IEZpeCByYWNlCmJldHdlZW4gZGV2aWNlIHNldHVwIGFuZCBvcGVuIikuCgpSb3NzIExh
Z2Vyd2FsbCAoMik6CiAgeGVuLW5ldGZyb250OiBGaXggbWlzbWF0Y2hlZCBydG5sX3VubG9jawog
IHhlbi1uZXRmcm9udDogVXBkYXRlIGZlYXR1cmVzIGFmdGVyIHJlZ2lzdGVyaW5nIG5ldGRldgoK
IGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwgMTEgKysrKysrLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLSAKMi45LjUKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
