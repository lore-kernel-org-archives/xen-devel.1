From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen-pciback: Allow enabling/disabling
 expansion ROM
Date: Mon, 03 Dec 2018 04:01:07 -0700
Message-ID: <5C050CF3020000780020223F__19136.7864878432$1543834795$gmane$org@prv1-mh.provo.novell.com>
References: <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com><cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com>
 <a05e3cf451d692dc4b1c81c8b5d66fc75d1fa325.1543772656.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTlyW-000895-4j
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 11:01:16 +0000
In-Reply-To: <a05e3cf451d692dc4b1c81c8b5d66fc75d1fa325.1543772656.git-series.marmarek@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Dwayne Litzenberger <dlitz@dlitz.net>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjEyLjE4IGF0IDE4OjQ3LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gRnJvbTogRHdheW5lIExpdHplbmJlcmdlciA8ZGxpdHpAZGxpdHoubmV0Pgo+
IAo+IE5ld2VyIEFNRCBHUFVzIHN0b3JlIHRoZWlyIGluaXRpYWxpemF0aW9uIHJvdXRpbmVzIGFz
IGJ5dGVjb2RlIG9uIHRoZQo+IFJPTS4gIFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBpbml0aWFs
aXphdGlvbiBlcnJvciBpbnNpZGUgdGhlIFZNIHdoZW4KPiBkb2luZyBQQ0kgcGFzc3Rocm91Z2g6
Cj4gCj4gICAgIHJhZGVvbiAwMDAwOjAwOjA1LjA6IEludmFsaWQgUENJIFJPTSBoZWFkZXIgc2ln
bmF0dXJlOiBleHBlY3RpbmcgMHhhYTU1LCBnb3QgMHhmZmZmCj4gICAgIHJhZGVvbiAwMDAwOjAw
OjA1LjA6IEludmFsaWQgUENJIFJPTSBoZWFkZXIgc2lnbmF0dXJlOiBleHBlY3RpbmcgMHhhYTU1
LCBnb3QgMHhmZmZmCj4gICAgIFtkcm06cmFkZW9uX2dldF9iaW9zIFtyYWRlb25dXSAqRVJST1Iq
IFVuYWJsZSB0byBsb2NhdGUgYSBCSU9TIFJPTQo+ICAgICByYWRlb24gMDAwMDowMDowNS4wOiBG
YXRhbCBlcnJvciBkdXJpbmcgR1BVIGluaXQKCklzbid0IGl0IHRoYXQgcWVtdSBpcyBzdXBwb3Nl
ZCB0byBzdXJmYWNlIHRoZSBST00gaW1hZ2UgdG8gZ3Vlc3RzLAptYWtpbmcgaXQgdW5uZWNlc3Nh
cnkgdG8gYWxsb3cgZ3Vlc3RzIGNvbnRyb2wgb3ZlciB0aGUgcGh5c2ljYWwKZW5hYmxlIGJpdD8g
QWxzbyB3aHkgd291bGQgYWxsb3dpbmcgdG8gYWx0ZXIgdGhlIGJpdCBkZXBlbmQgb24Kd2hldGhl
ciB0aGUgYWRkcmVzcyBwb3J0aW9uIG9mIHRoZSB2YWx1ZSBpcyBub24temVybz8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
