From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] libs/gnttab: fix FreeBSD gntdev
 interface
Date: Tue, 17 Apr 2018 16:27:04 +0200
Message-ID: <8f3adb2a-daff-7a47-ef8b-99b41f8c5e5a@suse.com>
References: <20180417130341.73560-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8RZc-0002V6-NV
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:27:08 +0000
In-Reply-To: <20180417130341.73560-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMTU6MDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBDdXJyZW50IGludGVy
ZmFjZSB0byB0aGUgZ250ZGV2IGluIEZyZWVCU0QgaXMgd3JvbmcsIGFuZCBtb3N0bHkgd29ya2Vk
Cj4gb3V0IG9mIGx1Y2sgYmVmb3JlIHRoZSBQVEkgRnJlZUJTRCBmaXhlcywgd2hlbiBrZXJuZWwg
YW5kIHVzZXItc3BhY2UKPiB3aGVyZSBzaGFyaW5nIHRoZSBzYW1lIHBhZ2UgdGFibGVzLgo+IAo+
IE9uIEZyZWVCU0QgaW9jdGxzIGhhdmUgdGhlIHNpemUgb2YgdGhlIHBhc3NlZCBzdHJ1Y3QgZW5j
b2RlZCBpbiB0aGUgaW9jdGwKPiBudW1iZXIsIGJlY2F1c2UgdGhlIGdlbmVyaWMgaW9jdGwgaGFu
ZGxlciBpbiB0aGUgT1MgdGFrZXMgY2FyZSBvZgo+IGNvcHlpbmcgdGhlIGRhdGEgZnJvbSB1c2Vy
LXNwYWNlIHRvIGtlcm5lbCBzcGFjZSwgYW5kIHRoZW4gY2FsbHMgdGhlCj4gZGV2aWNlIHNwZWNp
ZmljIGlvY3RsIGhhbmRsZXIuIFRodXMgdXNpbmcgaW9jdGwgc3RydWN0cyB3aXRoIHZhcmlhYmxl
Cj4gc2l6ZXMgaXMgbm90IHBvc3NpYmxlLgo+IAo+IFRoZSBmaXggaXMgdG8gdHVybiB0aGUgYXJy
YXkgb2Ygc3RydWN0cyBhdCB0aGUgZW5kIG9mCj4gaW9jdGxfZ250ZGV2X2FsbG9jX2dyZWYgYW5k
IGlvY3RsX2dudGRldl9tYXBfZ3JhbnRfcmVmIGludG8gcG9pbnRlcnMsCj4gdGhhdCBjYW4gYmUg
cHJvcGVybHkgYWNjZXNzZWQgZnJvbSB0aGUga2VybmVsIGdudGRldiBkcml2ZXIgdXNpbmcgdGhl
Cj4gY29weWluL2NvcHlvdXQgZnVuY3Rpb25zLiBOb3RlIHRoYXQgdGhpcyBpcyBleGFjdGx5IGhv
dyBpdCdzIGRvbmUgZm9yCj4gdGhlIHByaXZjbWQgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
