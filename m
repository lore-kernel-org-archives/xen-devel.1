From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: PVH dom0 creation fails - the system freezes
Date: Thu, 26 Jul 2018 13:08:32 +0200
Message-ID: <20180726110832.y6bpkt3z4movgpym@mac.bytemobile.com>
References: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
 <5B56F77202000078001D717D@prv1-mh.provo.novell.com>
 <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
 <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
 <9f85c7af-1115-6888-da0d-d5f93376939f@amazon.com>
 <20180725161210.qm3kmcw6ylfbycfk@mac.bytemobile.com>
 <3b825085-6fb2-6204-4eff-eaad8059f1d2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jynw=kk=citrix.com=prvs=738e045eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fie8U-0005Mr-HV
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 11:08:46 +0000
Content-Disposition: inline
In-Reply-To: <3b825085-6fb2-6204-4eff-eaad8059f1d2@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, abelgun@amazon.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Woodhouse <dwmw2@infradead.org>, bercarug@amazon.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDY6Mjk6MjVQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyNS8wNy8xOCAxODoxMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgSnVsIDI1LCAyMDE4IGF0IDA1OjA1OjM1UE0gKzAzMDAsIGJlcmNhcnVnQGFtYXpvbi5j
b20gd3JvdGU6Cj4gPj4gT24gMDcvMjUvMjAxOCAwNTowMiBQTSwgV2VpIExpdSB3cm90ZToKPiA+
Pj4gT24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDM6NDE6MTFQTSArMDIwMCwgSnVlcmdlbiBHcm9z
cyB3cm90ZToKPiA+Pj4+IE9uIDI1LzA3LzE4IDE1OjM1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+ID4+Pj4+PiBXaGF0IGNvdWxkIGJlIGNhdXNpbmcgdGhlIGF2YWlsYWJsZSBtZW1vcnkgbG9z
cyBwcm9ibGVtPwo+ID4+Pj4+IFRoYXQgc2VlbXMgdG8gYmUgTGludXggYWdncmVzc2l2ZWx5IGJh
bGxvb25pbmcgb3V0IG1lbW9yeSwgeW91IGdvIGZyb20KPiA+Pj4+PiA3MTI5TSB0b3RhbCBtZW1v
cnkgdG8gMjQ2TS4gQXJlIHlvdSBjcmVhdGluZyBhIGxvdCBvZiBkb21haW5zPwo+ID4+Pj4gVGhp
cyBtaWdodCBiZSByZWxhdGVkIHRvIHRoZSB0b29scyB0aGlua2luZyBkb20wIGlzIGEgUFYgZG9t
YWluLgo+ID4+PiBHb29kIHBvaW50Lgo+ID4+Pgo+ID4+PiBJbiB0aGF0IGNhc2UsIHhlbnN0b3Jl
LWxzIC1mcCB3b3VsZCBhbHNvIGJlIHVzZWZ1bC4gVGhlIG91dHB1dCBzaG91bGQKPiA+Pj4gc2hv
dyB0aGUgYmFsbG9vbiB0YXJnZXQgZm9yIERvbTAuCj4gPj4+Cj4gPj4+IFlvdSBjYW4gYWxzbyB0
cnkgdG8gc2V0IHRoZSBhdXRvYmFsbG9vbiB0byBvZmYgaW4gL2V0Yy94ZW4veGwuY2ZnIHRvIHNl
ZQo+ID4+PiBpZiBpdCBtYWtlcyBhbnkgZGlmZmVyZW5jZS4KPiA+Pj4KPiA+Pj4gV2VpLgo+ID4+
IEFsc28gdHJpZWQgc2V0dGluZyBhdXRvYmFsbG9vbmluZyBvZmYsIGJ1dCBpdCBoYWQgbm8gZWZm
ZWN0Lgo+ID4gCj4gPiBUaGlzIGlzIGEgTGludXgvbGlieGwgaXNzdWUgdGhhdCBJJ20gbm90IHN1
cmUgd2hhdCdzIHRoZSBiZXN0IHdheSB0bwo+ID4gc29sdmUuIExpbnV4IGhhcyB0aGUgZm9sbG93
aW5nICd3b3JrYXJvdW5kJyBpbiB0aGUgYmFsbG9vbiBkcml2ZXI6Cj4gPiAKPiA+IGVyciA9IHhl
bmJ1c19zY2FuZihYQlRfTklMLCAibWVtb3J5IiwgInN0YXRpYy1tYXgiLCAiJWxsdSIsCj4gPiAJ
CSAgICZzdGF0aWNfbWF4KTsKPiA+IGlmIChlcnIgIT0gMSkKPiA+IAlzdGF0aWNfbWF4ID0gbmV3
X3RhcmdldDsKPiA+IGVsc2UKPiA+IAlzdGF0aWNfbWF4ID4+PSBQQUdFX1NISUZUIC0gMTA7Cj4g
PiB0YXJnZXRfZGlmZiA9IHhlbl9wdl9kb21haW4oKSA/IDAKPiA+IAkJOiBzdGF0aWNfbWF4IC0g
YmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXM7Cj4gCj4gSG1tLCBzaG91bGRuJ3QgUFZIIGJlaGF2
ZSB0aGUgc2FtZSB3YXkgYXMgUFYgaGVyZT8gSSBkb24ndCB0aGluawo+IHRoZXJlIGlzIG1lbW9y
eSBtaXNzaW5nIGZvciBQVkgsIG9wcG9zZWQgdG8gSFZNJ3MgZmlybXdhcmUgbWVtb3J5LgoKVGhl
cmUncyBtZW1vcnkgbWlzc2luZyBmb3IgUFZILCBlZzogdGhlIGNvbnNvbGUgcGFnZSwgdGhlIFRT
UyBmb3IgcmVhbAptb2RlIChpZiByZXF1aXJlZCksIHRoZSBpZGVudGl0eSBwYWdlIHRhYmxlcyBm
b3IgcnVubmluZyBpbgpwcm90ZWN0ZWQgbW9kZSAoaWYgcmVxdWlyZWQpIGFuZCB0aGUgbWVtb3J5
IHVzZWQgdG8gc3RvcmUgdGhlIEFDUEkKdGFibGVzLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
