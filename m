From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12] x86/altp2m: Fix build with
 !CONFIG_HVM
Date: Thu, 28 Feb 2019 13:20:00 +0000
Message-ID: <20190228132000.5dmeokxydvxtpwsb@zion.uk.xensource.com>
References: <1551358272-666-1-git-send-email-andrew.cooper3@citrix.com>
 <20190228125345.rfst6ujtkgbjfeme@zion.uk.xensource.com>
 <ff2ecd90-9da2-caf9-08a2-8952259a7a04@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <ff2ecd90-9da2-caf9-08a2-8952259a7a04@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMDE6MTg6MTBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8wMi8yMDE5IDEyOjUzLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVGh1LCBG
ZWIgMjgsIDIwMTkgYXQgMTI6NTE6MTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+
PiBjL3MgMGVjOWI0ZWYzMTQ4ICJ4ODYvdm14OiBGaXggc2VjdXJpdHkgaXNzdWUgd2hlbiBhIGd1
ZXN0IGJhbGxvb25zIG91dCB0aGUKPiA+PiBjL3MgZTcyZWNjNzYxNTQxICJ4ODYvYWx0cDJtOiBS
ZXdvcmsgI1ZFIGVuYWJsZS9kaXNhYmxlIHBhdGhzIiBkaWRuJ3QgaGF2ZSBhCj4gPj4gc3VpdGFi
bGUgcHJvdG90eXBlIGluIHRoZSAhQ09ORklHX0hWTSBjYXNlLgo+ID4+Cj4gPj4gSW50cm9kdWNl
IG9uZSB0byBmaXggdGhlIGJ1aWxkLgo+ID4+Cj4gPj4gU3BvdHRlZCBieSBUcmF2aXMuCj4gPiBJ
IHRoaW5rIHlvdSBtZWFudCBHaXRsYWIgQ0k/Cj4gCj4gTm9wZS4KPiAKPiBodHRwczovL3RyYXZp
cy1jaS5vcmcvYW5keWhocC94ZW4vYnVpbGRzLzQ5OTc3NjczMgoKT2gsIEkgZm9yZ290IHRoZXkg
dXNlZCB0aGUgc2FtZSBzY3JpcHQuIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpXZWkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
