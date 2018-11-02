From: Tim Smith <tim.smith@citrix.com>
Subject: [PATCH 0/3] Performance improvements for xen_disk v2
Date: Fri, 2 Nov 2018 10:00:54 +0000
Message-ID: <154115285434.11300.8459925605672823399.stgit__29786.5857523449$1541153217$gmane$org@dhcp-3-135.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kuvl=nn=citrix.com=prvs=837a4a9fa=tim.smith@srs-us1.protection.inumbo.net>)
 id 1gIWGi-0003kW-B9
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 10:01:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>, Paul Durrant <Paul.Durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

QSBzZXJpZXMgb2YgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzIGZvciBkaXNrcyB1c2luZyB0aGUg
WGVuIFBWIHJpbmcuCgpUaGVzZSBoYXZlIGhhZCBmYWlybHkgZXh0ZW5zaXZlIHRlc3RpbmcuCgpU
aGUgYmF0Y2hpbmcgYW5kIGxhdGVuY3kgaW1wcm92ZW1lbnRzIHRvZ2V0aGVyIGJvb3N0IHRoZSB0
aHJvdWdocHV0Cm9mIHNtYWxsIHJlYWRzIGFuZCB3cml0ZXMgYnkgdHdvIHRvIHNpeCBwZXJjZW50
IChtZWFzdXJlZCB1c2luZyBmaW8KaW4gdGhlIGd1ZXN0KQoKQXZvaWRpbmcgcmVwZWF0ZWQgY2Fs
bHMgdG8gcG9zaXhfbWVtYWxpZ24oKSByZWR1Y2VkIHRoZSBkaXJ0eSBoZWFwCmZyb20gMjVNQiB0
byA1TUIgaW4gdGhlIGNhc2Ugb2YgYSBzaW5nbGUgZGF0YXBhdGggcHJvY2VzcyB3aGlsZSBhbHNv
CmltcHJvdmluZyBwZXJmb3JtYW5jZS4KCnYyIHJlbW92ZXMgc29tZSBjaGVja3BhdGNoIGNvbXBs
YWludHMgYW5kIGZpeGVzIHRoZSBDQ3MKCi0tLQoKVGltIFNtaXRoICgzKToKICAgICAgSW1wcm92
ZSB4ZW5fZGlzayBiYXRjaGluZyBiZWhhdmlvdXIKICAgICAgSW1wcm92ZSB4ZW5fZGlzayByZXNw
b25zZSBsYXRlbmN5CiAgICAgIEF2b2lkIHJlcGVhdGVkIG1lbW9yeSBhbGxvY2F0aW9uIGluIHhl
bl9kaXNrCgoKIGh3L2Jsb2NrL3hlbl9kaXNrLmMgfCAgIDgyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2Vy
dGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoKLS0KVGltIFNtaXRoIDx0aW0uc21pdGhAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
