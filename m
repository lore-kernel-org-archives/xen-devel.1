From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 for-4.12] gic-vgic: fix an assert
 condition
Date: Mon, 28 Jan 2019 13:04:06 +0100
Message-ID: <71c6093b-c805-deab-94f9-22f47821c23b@suse.com>
References: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1go5e5-0004sv-Qk
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 12:04:09 +0000
In-Reply-To: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Stefan Nuernberger <snu@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDEvMjAxOSAxODowNiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBBbmRyaWkg
QW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IEN1cnJlbnRseSwgdGhhdCBhc3Nl
cnQgY29uZGl0aW9uIGRvZXMgbm90IGNvcnJlc3BvbmQgdG8gYSBjb21tZW50IGFib3ZlCj4gYW5k
IG1ha2VzIGFzc2VydGlvbiBmYWlsZWQgb24gSFcgSVJRIGRpc2Nvbm5lY3Rpb24uCj4gRml4IHRo
ZSBjb25kaXRpb24gc28gaXQgY29ycmVzcG9uZHMgdG8gdGhlIGNvbW1lbnQgYW5kIGFsbG93cyBJ
UlEKPiBkaXNjb25uZWN0aW9uIG9uIGRlYnVnIGJ1aWxkcy4KPiAKPiBGaXhlczogZWMyYTJmMSAo
IkFSTTogVkdJQzogZmFjdG9yIG91dCB2Z2ljX2Nvbm5lY3RfaHdfaXJxKCkiKQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gU3VnZ2VzdGVk
LWJ5OiBTdGVmYW4gTnVlcm5iZXJnZXIgPHNudUBhbWF6b24uZGU+CgpSZWxlYXNlLWFja2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
