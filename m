From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] docs/qemu-deprivilege: Revise and update
 with status and future plans
Date: Tue, 27 Mar 2018 15:45:43 +0100
Message-ID: <294e3e91-9647-1b50-49c4-f9e79db80344@citrix.com>
References: <20180322182437.936-1-george.dunlap@citrix.com>
 <23225.8997.574938.415857@mariner.uk.xensource.com>
 <87f60317-7913-a3ad-58eb-59928b8d7d61@citrix.com>
 <23226.18455.602635.161530@mariner.uk.xensource.com>
 <1a845c55-df25-1754-3e14-bdc47e658da8@citrix.com>
 <df2b93b0-eae0-88f0-a13e-90f4b7600271@citrix.com>
 <23226.22304.897152.737299@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3kby=gr=citrix.com=prvs=6177cea8c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1f0psE-0003lM-09
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 14:46:54 +0000
In-Reply-To: <23226.22304.897152.737299@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjcvMjAxOCAwMzozNyBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJSZTogW1BBVENIXSBkb2NzL3FlbXUtZGVwcml2aWxlZ2U6IFJldmlzZSBhbmQg
dXBkYXRlIHdpdGggc3RhdHVzIGFuZCBmdXR1cmUgcGxhbnMiKToKPj4gVGhlIGFsdGVybmF0ZSB3
b3VsZCBiZSB0byBoYXZlIHlldCBhbm90aGVyIFVJRCByYW5nZSwgdG8gdGhhdCB3ZSBjb3VsZAo+
PiBoYXZlIGEgInRhcmdldCBJRCIgKGkuZS4sIFFFTVUpIGFuZCBhICJyZWFwZXIgSUQiIGZvciBl
YWNoIGRvbWFpbi4gIEkKPj4gdGhpbmsgdGhhdCBzaG91bGQgbWVhbiBhbnkgcmFjZXMgc2hvdWxk
IGJlIGJlbmlnbi4KPiAKPiBUaGF0IHdvdWxkIG1lYW4gZ29iYmxpbmcgMl4xNyB1aWRzIHJhdGhl
ciB0aGFuIDJeMTYuICBEb2Vzbid0IHNlZW0KPiBkZXNpcmFibGUgdG8gbWUsIHRvIGFkZCBhIG1p
bmlzY3VsZSBhbW91bnQgb2YgY29uY3VycmVuY3kgdG8gYSBwcmV0dHkKPiBoZWF2eXdlaWdodCBv
cGVyYXRpb24uCgpJIHRoaW5rIGFsbCB0aGUgT1NlcyB0aGF0IGNhbiBydW4gYXMgYSBkb20wIGhh
dmUgMzItYml0IFVJRHMgYW55d2F5Cih3aGljaCBpcyB3aHkgYWZ0ZXIgbXkgcGF0Y2ggdGhlIGRv
Y3VtZW50IHN1Z2dlc3RzIHN0YXJ0aW5nIHdpdGggVUlECjY1NTM2KS4gIEkgd2FzIG1vcmUgd29y
cmllZCBhYm91dCB0aGUgY29tcGxleGl0eSBvZiBpbXBsZW1lbnRhdGlvbi4KCkJ1dCBJIGRvbid0
IGhhdmUgdGVycmlibHkgc3Ryb25nIGZlZWxpbmdzIGFib3V0IGl0LgoKIC1HZW9yZ2UKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
