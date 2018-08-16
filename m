From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Ping: [PATCH v5 2/2] x86: enable interrupts earlier
 with XPTI disabled
Date: Thu, 16 Aug 2018 09:08:58 +0100
Message-ID: <a0914d8b-900a-7606-65fd-33a8b64730fc@citrix.com>
References: <5B31E7A102000078001CDCC5@prv1-mh.provo.novell.com>
 <5B31E8BF02000078001CDCDE@prv1-mh.provo.novell.com>
 <5B752F4A02000078001DEBBA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rytq=k7=citrix.com=prvs=759b2abc3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fqDL3-0008AR-3P
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 08:09:01 +0000
In-Reply-To: <5B752F4A02000078001DEBBA@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDgvMjAxOCAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMDYuMTgg
YXQgMDk6MTgsICB3cm90ZToKPj4gVGhlIFNUSSBpbnN0YW5jZXMgd2VyZSBtb3ZlZCAob3IgYWRk
ZWQgaW4gdGhlIElOVDgwIGNhc2UpIHRvIG1lZXQgVExCCj4+IGZsdXNoIHJlcXVpcmVtZW50cy4g
V2hlbiBYUFRJIGlzIGRpc2FibGVkLCB0aGV5IGNhbiBiZSBwdXQgYmFjayB3aGVyZQo+PiB0aGV5
IHdlcmUgKG9yIG9taXR0ZWQgaW4gdGhlIElOVDgwIGNhc2UpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFRlc3RlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiBJJ2Qgbm90IGJlIG92ZXJseSBjb25jZXJuZWQgaWYgdGhpcyB3YXMgbmFjay1lZCBmb3Ig
YW4gYWNjZXB0YWJsZQo+IHJlYXNvbiwgYnV0IEknZCBsaWtlIHRvIGhlYXIgc28gaW4gdGhhdCBj
YXNlLCBiZWNhdXNlIHRoZSBhbHRlcm5hdGl2ZQo+IHRvIHRoaXMgcGF0Y2ggaXMgdG8gZHJvcCB0
aGUgc3ludGhldGljIE5PX1hQVEkgZmVhdHVyZSBmbGFnLCB3aGljaAo+IGlzIG5vdCB1c2VkIGFu
eXdoZXJlIGVsc2Ugd2l0aG91dCB0aGlzIGNoYW5nZS4KClRoZXJlIGFyZSAyIGlzc3VlcyB0byBj
b25zaWRlci4KCjEpIEp1ZXJnZW5zIHBlcmZvcm1hbmNlIG51bWJlcnMgc2FpZCB0aGlzIG1ha2Ug
dGhpbmdzIHdvcnNlLsKgIChNZWFuCmFyb3VuZCB0aGUgc2FtZSwgc3RkIGRldmlhdGlvbiBzaG90
IHVwIGlpcmMpCjIpIFlvdSBhcmUgdmFzdGx5IGNvbXBsaWNhdGluZyB0aGUgZW50cnkgcGF0aHMs
IGJlY2F1c2Ugd2hldGhlcgppbnRlcnJ1cHRzIGFyZSBlbmFibGVkIG9yIG5vdCBpcyBub3cgdmFy
aWFibGUgb24gcnVudGltZSBjb25maWd1cmF0aW9uLgoKSSBkb24ndCBzZWUgYW55IGJlbmVmaXQg
ZnJvbSB0aGlzIHBhdGNoLCBhbmQgSSBzZWUgc2V2ZXJhbCBuZWdhdGl2ZXMsCmJvdGggaW4gdGVy
bXMgb2YgcGVyZm9ybWFuY2VzLCBhbmQgaW4gdGVybXMgb2YgaG93IGVhc3kgdGhlIGNvZGUgaXMg
dG8KcmVhc29uIGFib3V0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
