From: Juergen Gross <jgross@suse.com>
Subject: Re: [Memory Accounting] was: Re: PVH dom0 creation
 fails - the system freezes
Date: Thu, 26 Jul 2018 11:41:24 +0200
Message-ID: <14a32d62-6d85-43ce-8f03-32c794bd3e6a@suse.com>
References: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
 <5B56F77202000078001D717D@prv1-mh.provo.novell.com>
 <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
 <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
 <9f85c7af-1115-6888-da0d-d5f93376939f@amazon.com>
 <20180725161210.qm3kmcw6ylfbycfk@mac.bytemobile.com>
 <3b825085-6fb2-6204-4eff-eaad8059f1d2@suse.com>
 <b0d37c05-3438-477b-3bd6-63e01e70de62@citrix.com>
 <76c92f25-9d0b-e317-ba9b-80c6f7d6dd64@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ri59=kk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ficm1-0007Lt-3W
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 09:41:29 +0000
In-Reply-To: <76c92f25-9d0b-e317-ba9b-80c6f7d6dd64@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, bercarug@amazon.com
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, David Woodhouse <dwmw2@infradead.org>, Jan Beulich <JBeulich@suse.com>, abelgun@amazon.com
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDcvMTggMDE6MDcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNy8yNS8yMDE4
IDAyOjU2IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyNS8wNy8xOCAxNzoyOSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4+IE9uIDI1LzA3LzE4IDE4OjEyLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pj4+IE9uIFdlZCwgSnVsIDI1LCAyMDE4IGF0IDA1OjA1OjM1UE0gKzAzMDAsIGJl
cmNhcnVnQGFtYXpvbi5jb20gd3JvdGU6Cj4+Pj4+IE9uIDA3LzI1LzIwMTggMDU6MDIgUE0sIFdl
aSBMaXUgd3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIEp1bCAyNSwgMjAxOCBhdCAwMzo0MToxMVBNICsw
MjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+IE9uIDI1LzA3LzE4IDE1OjM1LCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+Pj4+Pj4gV2hhdCBjb3VsZCBiZSBjYXVzaW5nIHRoZSBh
dmFpbGFibGUgbWVtb3J5IGxvc3MgcHJvYmxlbT8KPj4+Pj4+Pj4gVGhhdCBzZWVtcyB0byBiZSBM
aW51eCBhZ2dyZXNzaXZlbHkgYmFsbG9vbmluZyBvdXQgbWVtb3J5LCB5b3UgZ28gZnJvbQo+Pj4+
Pj4+PiA3MTI5TSB0b3RhbCBtZW1vcnkgdG8gMjQ2TS4gQXJlIHlvdSBjcmVhdGluZyBhIGxvdCBv
ZiBkb21haW5zPwo+Pj4+Pj4+IFRoaXMgbWlnaHQgYmUgcmVsYXRlZCB0byB0aGUgdG9vbHMgdGhp
bmtpbmcgZG9tMCBpcyBhIFBWIGRvbWFpbi4KPj4+Pj4+IEdvb2QgcG9pbnQuCj4+Pj4+Pgo+Pj4+
Pj4gSW4gdGhhdCBjYXNlLCB4ZW5zdG9yZS1scyAtZnAgd291bGQgYWxzbyBiZSB1c2VmdWwuIFRo
ZSBvdXRwdXQgc2hvdWxkCj4+Pj4+PiBzaG93IHRoZSBiYWxsb29uIHRhcmdldCBmb3IgRG9tMC4K
Pj4+Pj4+Cj4+Pj4+PiBZb3UgY2FuIGFsc28gdHJ5IHRvIHNldCB0aGUgYXV0b2JhbGxvb24gdG8g
b2ZmIGluIC9ldGMveGVuL3hsLmNmZyB0byBzZWUKPj4+Pj4+IGlmIGl0IG1ha2VzIGFueSBkaWZm
ZXJlbmNlLgo+Pj4+Pj4KPj4+Pj4+IFdlaS4KPj4+Pj4gQWxzbyB0cmllZCBzZXR0aW5nIGF1dG9i
YWxsb29uaW5nIG9mZiwgYnV0IGl0IGhhZCBubyBlZmZlY3QuCj4+Pj4gVGhpcyBpcyBhIExpbnV4
L2xpYnhsIGlzc3VlIHRoYXQgSSdtIG5vdCBzdXJlIHdoYXQncyB0aGUgYmVzdCB3YXkgdG8KPj4+
PiBzb2x2ZS4gTGludXggaGFzIHRoZSBmb2xsb3dpbmcgJ3dvcmthcm91bmQnIGluIHRoZSBiYWxs
b29uIGRyaXZlcjoKPj4+Pgo+Pj4+IGVyciA9IHhlbmJ1c19zY2FuZihYQlRfTklMLCAibWVtb3J5
IiwgInN0YXRpYy1tYXgiLCAiJWxsdSIsCj4+Pj4gCQkgICAmc3RhdGljX21heCk7Cj4+Pj4gaWYg
KGVyciAhPSAxKQo+Pj4+IAlzdGF0aWNfbWF4ID0gbmV3X3RhcmdldDsKPj4+PiBlbHNlCj4+Pj4g
CXN0YXRpY19tYXggPj49IFBBR0VfU0hJRlQgLSAxMDsKPj4+PiB0YXJnZXRfZGlmZiA9IHhlbl9w
dl9kb21haW4oKSA/IDAKPj4+PiAJCTogc3RhdGljX21heCAtIGJhbGxvb25fc3RhdHMudGFyZ2V0
X3BhZ2VzOwo+Pj4gSG1tLCBzaG91bGRuJ3QgUFZIIGJlaGF2ZSB0aGUgc2FtZSB3YXkgYXMgUFYg
aGVyZT8gSSBkb24ndCB0aGluawo+Pj4gdGhlcmUgaXMgbWVtb3J5IG1pc3NpbmcgZm9yIFBWSCwg
b3Bwb3NlZCB0byBIVk0ncyBmaXJtd2FyZSBtZW1vcnkuCj4+Pgo+Pj4gQWRkaW5nIEJvcmlzIGZv
ciBhIHNlY29uZCBvcGluaW9uLgo+IAo+IChOb3R3aXRoc3RhbmRpbmcgQW5kcmV3cycgcmFudCBi
ZWxvdyA7LSkpCj4gCj4gSSBhbSB0cnlpbmcgdG8gcmVtZW1iZXIgLS0tIHdoYXQgbWVtb3J5IHdl
cmUgd2UgdHJ5aW5nIG5vdCB0byBvbmxpbmUgZm9yCj4gSFZNIGhlcmU/CgpUaGUgcHJvYmxlbSB3
YXMgdG8gbm90IG9ubGluZSBtZW1vcnkgYXV0b21hdGljYWxseSB3aGljaCB3YXMgYWRkZWQgbGF0
ZXIKdmlhIGhvdHBsdWcgKGVzcGVjaWFsbHkgTlZESU1NcykuIFRoaXMgaGFwcGVuZWQgYXMgdGhl
IHJlcG9ydGVkIG1lbW9yeQpzaXplcyB2aWEgRTgyMCBtYXAgYW5kIGh5cGVydmlzb3IgZGlmZmVy
ZWQgZHVlIHRvIEhWTSdzIGZpcm13YXJlIG1lbW9yeS4KU28gdGhlIGluaXRpYWwgdGFyZ2V0IHNp
emUgd2FzIGxhcmdlciB0aGFuIHRoZSBpbml0aWFsIG1lbW9yeSBzaXplCnJlcG9ydGVkIHZpYSBF
ODIwIG1hcC4gVGhpcyBsZWQgdG8gYXV0b21hdGljIGJhbGxvb25pbmcgdXAgd2hlbiBhIE5WRElN
TQp3YXMgYWRkZWQgdG8gdGhlIEhWTSBndWVzdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
