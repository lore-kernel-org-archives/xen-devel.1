From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2] x86/altp2m: cleanup p2m_altp2m_lazy_copy
Date: Mon, 27 May 2019 18:02:43 -0600
Message-ID: <CABfawhmWLivZv6Jz=Shj23t738Qi7G4XRoMfDeJYKqhjWAKrKw@mail.gmail.com>
References: <20190412200813.25447-1-tamas@tklengyel.com>
 <46d12d38-cc34-0a2a-7d08-42b9256d5b05@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ktOE=T4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hVPaO-0005eH-5Y
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 00:03:24 +0000
Received: by mail-wr1-f52.google.com with SMTP id h1so4104467wro.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 17:03:21 -0700 (PDT)
In-Reply-To: <46d12d38-cc34-0a2a-7d08-42b9256d5b05@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgOTo1NSBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xMi8xOSA5OjA4IFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBUaGUgcDJtX2FsdHAybV9sYXp5X2NvcHkgaXMgcmVzcG9uc2libGUg
Zm9yIGxhemlseSBwb3B1bGF0aW5nIGFuIGFsdHAybSB2aWV3Cj4gPiB3aGVuIHRoZSBndWVzdCB0
cmFwcyBvdXQgZHVlIHRvIG5vIEVQVCBlbnRyeSBiZWluZyBwcmVzZW50IGluIHRoZSBhY3RpdmUg
dmlldy4KPiA+IEN1cnJlbnRseSB0aGUgZnVuY3Rpb24gdG9vayBzZXZlcmFsIGlucHV0cyB0aGF0
IGl0IGRpZG4ndCB1c2UgYW5kIGFsc28KPiA+IGxvY2tlZC91bmxvY2tlZCBnZm5zIHdoZW4gaXQg
ZGlkbid0IG5lZWQgdG8uCj4KPiBXb3csIHRoZSBjb2RlIHlvdSdyZSBjbGVhbmluZyB1cCB3YXMg
cmVhbGx5IGFsbCBvdmVyIHRoZSBwbGFjZS4gIFRoYW5rcwo+IGZvciB0aGlzLgo+Cj4gVGhlIGNv
ZGUgaW4geW91ciBwYXRjaCBsb29rcyBjb3JyZWN0OyBidXQgd2hpbGUgeW91J3ZlIGdvdHRlbiBy
aWQgb2YgdGhlCj4gcmVkdW5kYW50IGhvc3QgcDJtIGxvb2t1cCwgdGhlcmUncyBzdGlsbCBhIHJl
ZHVuZGFudCBhbHRwMm0gbG9va3VwLiAgSXMKPiB0aGVyZSBhbnkgcmVhc29uIG5vdCB0byB0YWtl
IGl0IHRvIGl0cyBsb2dpY2FsIGNvbmNsdXNpb24sIGxpa2UgdGhlCj4gYXR0YWNoZWQgcGF0Y2g/
CgpMb29rcyBnb29kIHRvIG1lLgoKPgo+IE5CIHRoaXMgaXMgY29tcGlsZS10ZXN0ZWQgb25seTsg
ZGVmaW5pdGVseSBkb3VibGUtY2hlY2sgaXQgZm9yIGxvZ2ljIGVycm9ycy4KCkkgZGlkIGEgbGl2
ZSB0ZXN0IGFuZCBldmVyeXRoaW5nIHdvcmtzIGZpbmUuCgpUaGFua3MsClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
