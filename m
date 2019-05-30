From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: [stable] xen/pciback: Don't disable PCI_COMMAND on PCI
 device reset.
Date: Thu, 30 May 2019 16:16:55 +0100
Message-ID: <1559229415.24330.2.camel__26416.247214523$1559229659$gmane$org@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IneZ=T6=codethink.co.uk=ben.hutchings@srs-us1.protection.inumbo.net>)
 id 1hWMnp-0000KY-He
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 15:17:13 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>, stable <stable@vger.kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SSdtIGxvb2tpbmcgYXQgQ1ZFLTIwMTUtODU1MyB3aGljaCBpcyBmaXhlZCBieToKCmNvbW1pdCA3
NjgxZjMxZWM5Y2RhY2FiNGZkMTA1NzBiZTkyNGYyY2VmNjY2OWJhCkF1dGhvcjogS29ucmFkIFJ6
ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpEYXRlOsKgwqDCoFdlZCBGZWIg
MTMgMTg6MjE6MzEgMjAxOSAtMDUwMAoKwqDCoMKgwqB4ZW4vcGNpYmFjazogRG9uJ3QgZGlzYWJs
ZSBQQ0lfQ09NTUFORCBvbiBQQ0kgZGV2aWNlIHJlc2V0LgoKSSdtIGF3YXJlIHRoYXQgdGhpcyBj
aGFuZ2UgaXMgaW5jb21wYXRpYmxlIHdpdGggcWVtdSA8IDIuNSwgYnV0IHRoYXQncwpub3cgcXVp
dGUgb2xkLiAgRG8geW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGFwcGx5IHRoaXMgY2hhbmdl
IHRvCnNvbWUgc3RhYmxlIGJyYW5jaGVzPwoKQmVuLgoKLS0gCkJlbiBIdXRjaGluZ3MsIFNvZnR3
YXJlIERldmVsb3BlciAgICAgICAgICAgICAgICDCoCAgICAgICAgQ29kZXRoaW5rIEx0ZApodHRw
czovL3d3dy5jb2RldGhpbmsuY28udWsvICAgICAgICAgICAgICAgICBEYWxlIEhvdXNlLCAzNSBE
YWxlIFN0cmVldAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWFuY2hlc3Rl
ciwgTTEgMkhGLCBVbml0ZWQgS2luZ2RvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
