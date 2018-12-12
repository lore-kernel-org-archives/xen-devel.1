From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel]  xen_disk qdevification
Date: Wed, 12 Dec 2018 13:04:04 +0100
Message-ID: <87y38vhryj.fsf__17886.9033269168$1544616167$gmane$org@dusky.pond.sub.org>
References: <154115285434.11300.8459925605672823399.stgit@dhcp-3-135.uk.xensource.com>
 <20181102110412.GD7521@dhcp-200-186.str.redhat.com>
 <20181212085951.GA7604@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7QV9=OV=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1gX3FJ-0007R1-LT
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:04:09 +0000
In-Reply-To: <20181212085951.GA7604@aepfle.de> (Olaf Hering's message of "Wed,
 12 Dec 2018 09:59:51 +0100")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, Tim Smith <tim.smith@citrix.com>, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPiB3cml0ZXM6Cgo+IE9uIEZyaSwgTm92IDAyLCBL
ZXZpbiBXb2xmIHdyb3RlOgo+Cj4+IEEgd2hpbGUgYWdvLCBhIGRvd25zdHJlYW0gcGF0Y2ggcmV2
aWV3IGZvdW5kIG91dCB0aGF0IHRoZXJlIGFyZSBzb21lIFFNUAo+PiBjb21tYW5kcyB0aGF0IHdv
dWxkIGltbWVkaWF0ZWx5IGNyYXNoIGlmIGEgeGVuX2Rpc2sgZGV2aWNlIHdlcmUgcHJlc2VudAo+
PiBiZWNhdXNlIG9mIHRoZSBsYWNraW5nIHFkZXZpZmljYXRpb24uIFRoaXMgaXMgbm90IHRoZSBj
b2RlIHF1YWxpdHkKPj4gc3RhbmRhcmQgSSBlbnZpc2lvbiBmb3IgUUVNVS4gSXQncyB0aW1lIGZv
ciBub24tcWRldiBkZXZpY2VzIHRvIGdvLgo+Cj4gRG8geW91IGhhdmUgdGhhdCBiYWNrd2FyZHMg
YnkgYW55IGNoYW5jZT8gSU1PIHRoZSBwcmVzZW5jZSBvZiBhc3NlcnQoKQo+IGNvbnRyaWJ1dGVz
IHRvIGJhZCBjb2RlIHF1YWxpdHksIG5vdCB0aGUgZHJpdmVycyB0aGF0IHRyaWdnZXIgdGhvc2UK
PiBhc3NlcnRzLiBJdCBpcyBiYWQgZW5vdWdoIHRoYXQgdHdvIFFFTVUgcmVsZWFzZXMgd2VudCBv
dXQgd2hpbGUgYmVpbmcgaW4KPiBiYWQgc2hhcGUuCgpDb252ZXJ0aW5nIGJsb2NrIGRldmljZXMg
dG8gdGhlIHFkZXYgaW5mcmFzdHJ1Y3R1cmUgKGludHJvZHVjZWQgaW4gMjAwOSkKaGFzIGJlZW4g
YSBsb25nd2luZGVkIGFmZmFpci4gIFdlJ3ZlIHJlcGVhdGVkbHkgcmVtaW5kZWQgcGVvcGxlIGlu
CmNoYXJnZSBvZiB0aGUgc3RyYWdnbGVycyB0byB1cGRhdGUgdGhlaXIgY29kZS4KCk5lZ2xlY3Rp
bmcgdG8gdXBkYXRlIGNvZGUgdG8gY3VycmVudCBpbmZyYXN0cnVjdHVyZSBjcmVhdGVzIGEgYnVy
ZGVuIGFuZAphIHJpc2suICBUaGUgYnVyZGVuIGlzIG9uIHRoZSBtYWludGFpbmVycyBvZiB0aGUg
aW5mcmFzdHJ1Y3R1cmU6IHRoZXkKZ2V0IHRvIGRyYWcgYWxvbmcgb3V0bW9kZWQgaW5mcmFzdHJ1
Y3R1cmUuICBUaGUgcmlzayBpcyBvbiB0aGUgdXNlcnMgb2YKdGhlIGNvZGU6IGl0IGJlY29tZXMg
YSBzcGVjaWFsIGNhc2UsIGFuZCBldmVudHVhbGx5IGFjcXVpcmVzIGl0cyBzcGVjaWFsCmJ1Z3Mu
CgpQdXR0aW5nIHRoZSBibGFtZSBmb3IgdGhlbSBlbnRpcmVseSBvbiB0aGUgbWFpbnRhaW5lcnMg
b2YgdGhlCmluZnJhc3RydWN0dXJlIGlzIG5vdCBmYWlyLgoKPiBBbnl3YXksIGhvcGVmdWxseSBQ
YXVsIG9yIHdob2V2ZXIgd2lsbCBmaW5kIHRoZSB0aW1lIGFuZCBlbmVyZ3kgdG8KPiBjb252ZXJ0
IHRoZSBjb2RlIGF0IHNvbWUgcG9pbnQuCgpZZXMsIFBhdWwncyB0YWtpbmcgY2FyZSBvZiBpdC4g
IE11Y2ggYXBwcmVjaWF0ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
