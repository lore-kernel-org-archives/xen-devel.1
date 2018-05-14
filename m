From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Mon, 14 May 2018 14:27:39 -0400
Message-ID: <b0c80258-008a-9b4e-38c9-a5451b59c44e__4489.94571711427$1526322207$gmane$org@oracle.com>
References: <20180509203318.2611-1-boris.ostrovsky@oracle.com>
 <20180509203318.2611-2-boris.ostrovsky@oracle.com>
 <5AF9862C02000078001C27B5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x2e/=ib=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fII9K-00013l-Ew
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 18:24:42 +0000
In-Reply-To: <5AF9862C02000078001C27B5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTQvMjAxOCAwODo1MCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDUu
MTggYXQgMjI6MzMsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IEBAIC02
NCw2ICs2NywxNyBAQCBFTlRSWShwdmhfc3RhcnRfeGVuKQo+PiAgCW1vdiAlZWF4LCVlcwo+PiAg
CW1vdiAlZWF4LCVzcwo+PiAgCj4+ICsJLyogU2V0IGJhc2UgYWRkcmVzcyBpbiBzdGFjayBjYW5h
cnkgZGVzY3JpcHRvci4gKi8KPj4gKwltb3ZsIF9wYShnZHRfc3RhcnQpLCVlYXgKPj4gKwltb3Zs
ICRfcGEoY2FuYXJ5KSwlZWN4Cj4+ICsJbW92dyAlY3gsIChQVkhfR0RUX0VOVFJZX0NBTkFSWSAq
IDgpICsgMCglZWF4KQo+PiArCXNocmwgJDE2LCAlZWN4Cj4+ICsJbW92YiAlY2wsIChQVkhfR0RU
X0VOVFJZX0NBTkFSWSAqIDgpICsgMiglZWF4KQo+PiArCW1vdmIgJWNoLCAoUFZIX0dEVF9FTlRS
WV9DQU5BUlkgKiA4KSArIDUoJWVheCkKPiBJcyB0aGlzIG1lYW5pbmdmdWwgLyBjb3JyZWN0IGZv
ciB0aGUgNjQtYml0IGNhc2U/IEknZCByYXRoZXIgZXhwZWN0IHlvdSB0bwo+IHdyaXRlIHRoZSBH
UyBiYXNlIGFkZHJlc3MgTVNSIHRoZXJlLgoKWWVzLCBJIHNob3VsZCB1c2UgdGhlIE1TUiBmb3Ig
NjQtYml0IG1vZGUgYW5kIGV4aXN0aW5nIGNvZGUgZm9yIDMyLWJpdCBtb2RlLgoKLWJvcmlzCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
