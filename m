From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/3] x86/pvh: Print the PVH start info more
 concisely
Date: Mon, 21 Jan 2019 15:53:29 +0000
Message-ID: <20190121155329.fea6njeub6mqbrw2@zion.uk.xensource.com>
References: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
 <1548085041-23786-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1548085041-23786-4-git-send-email-andrew.cooper3@citrix.com>
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

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDM6Mzc6MjFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgY3VycmVudCByZW5kZXJpbmcgb2YgUFZIIHN0YXJ0IGluZm8gaW4gdW5uZWNl
c3NhcmlseSB2ZXJib3NlLCBhbmQgZG9lc24ndAo+IGNsZWFybHkgc2VwYXJhdGUgZGVjaW1hbCBh
bmQgaGV4IG51bWJlcnMuCj4gCj4gQWxsIGFkZHJlc3NlcyBhcmUgZXhwZWN0ZWQgdG8gYmUgYmVs
b3cgdGhlIDRHIGJvdW5kYXJ5LCBzbyBkcm9wIDggcmVkdW5kYW50Cj4gemVyb2VzIG9uIGFsbCBw
aHlzaWNhbCBhZGRyZXNzZXMuICBQcm9wZXJseSBwcmVmaXggYWxsIGhleCBudW1iZXJzLCBhbmQg
Zm9sZAo+IHJlbGF0ZWQgaW5mb3JtYXRpb24gb250byB0aGUgc2FtZSBsaW5lLgo+IAo+IEJlZm9y
ZToKPiAgIChYRU4pIFBWSCBzdGFydCBpbmZvOiAocGEgMDAwMGZmYzApCj4gICAoWEVOKSAgIHZl
cnNpb246ICAgIDEKPiAgIChYRU4pICAgZmxhZ3M6ICAgICAgMAo+ICAgKFhFTikgICBucl9tb2R1
bGVzOiAxCj4gICAoWEVOKSAgIG1vZGxpc3RfcGE6IDAwMDAwMDAwMDAwMGZmODAKPiAgIChYRU4p
ICAgY21kbGluZV9wYTogMDAwMDAwMDAwMDAwZmZhMAo+ICAgKFhFTikgICBjbWRsaW5lOiAgICAn
Y29uc29sZT1wdix4ZW4nCj4gICAoWEVOKSAgIHJzZHBfcGE6ICAgIDAwMDAwMDAwZmMwMDkwMDAK
PiAgIChYRU4pICAgICBtb2RbMF0ucGE6ICAgICAgICAgMDAwMDAwMDAwMDU5OTAwMAo+ICAgKFhF
TikgICAgIG1vZFswXS5zaXplOiAgICAgICAwMDAwMDAwMDAxMjA0MjI0Cj4gICAoWEVOKSAgICAg
bW9kWzBdLmNtZGxpbmVfcGE6IDAwMDAwMDAwMDAwMDAwMDAKPiAKPiBBZnRlcjoKPiAgIChYRU4p
IFBWSCBzdGFydCBpbmZvOiAocGEgMHgwMDAwZmZjMCkKPiAgIChYRU4pICAgdmVyc2lvbiAxLCBm
bGFncyAwCj4gICAoWEVOKSAgIGNtZGxpbmUgMHgwMDAwZmZhMCAnY29uc29sZT1wdix4ZW4nCj4g
ICAoWEVOKSAgIHJzZHAgICAgMHhmYzAwOTAwMAo+ICAgKFhFTikgICBtb2RsaXN0IDB4MDAwMGZm
ODAsIG5yIDEKPiAgIChYRU4pICAgICBtb2QwIHBhIDB4MDA1ZjQwMDAsIHN6IDB4MDAxMjYwMDAs
IGNtZGxpbmUgMHgwMDAwMDAwMAo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
