From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/pvh: Fixes to convert_pvh_info()
Date: Mon, 21 Jan 2019 15:54:41 +0000
Message-ID: <a8e82922-3025-bbc7-3eb5-6feb8f4c17c5@citrix.com>
References: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
 <1548085041-23786-3-git-send-email-andrew.cooper3@citrix.com>
 <20190121155222.6ldahzwkjfcsx4om@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190121155222.6ldahzwkjfcsx4om@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDEvMjAxOSAxNTo1MiwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEphbiAyMSwgMjAx
OSBhdCAwMzozNzoyMFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBwYW5pYygpIGRv
ZXNuJ3QgY29udGFpbiBhbnkgY2FsbGVyIGluZm9ybWF0aW9uLCBzbyB0aGUgc3VtIG91dHB1dCBv
ZjoKPj4KPj4gICAoZDEpIChYRU4pCj4+ICAgKGQxKSAoWEVOKSAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCj4+ICAgKGQxKSAoWEVOKSBQYW5pYyBvbiBDUFUgMDoKPj4g
ICAoZDEpIChYRU4pIE1hZ2ljIHZhbHVlIGlzIHdyb25nOiAzMzZlYzU2OAo+PiAgIChkMSkgKFhF
TikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+PiAgIChkMSkgKFhF
TikKPj4KPj4gaXNuJ3QgaGVscGZ1bCBhdCBpZGVudGlmeWluZyB3aGF0IHdlbnQgd3JvbmcuICBV
cGRhdGUgdGhlIHBhbmljKCkgc3RyaW5ncyB0bwo+PiBpZGVudGlmeSBQVkggYW5kIGFpZCB3aXRo
IGRpYWdub3N0aWNzLgo+Pgo+PiBUaGUgQlVHX09OKCkgY2hlY2sgZm9yIEFSUkFZX1NJWkUocHZo
X21iaV9tb2RzKSBpcyBvZmYtYnktb25lLCBhbmQgcmVkdW5kYW50Cj4+IHdpdGggdGhlIGVhcmxp
ZXIgcGFuaWMoKSB3aGljaCBleHBsYWlucyB0aGluZ3MgaW4gbW9yZSBkZXRhaWwuICBEcm9wIGl0
Lgo+Pgo+PiBGaW5hbGx5LCBYZW4gdGFrZXMgbnJfbW9kdWxlcyAhPSAwIHRvIG1lYW4gdGhhdCBt
b2RsaXN0X3BhZGRyIGlzIHZhbGlkLCBidXQgYQo+PiBjbGV2ZXJseSBjcmFmdGVyZCBQVkggc3Rh
cnQgaW5mbyBsYXlvdXQgY2FuIGNhdXNlIFhlbiB0byB1c2UgbW9kbGlzdF9wYWRkciBhdAo+PiBn
YWRkciAwLCBpbiB2aW9sYXRpb24gb2YgdGhlIFBWSCBzcGVjLgo+IERvIHlvdSBtZWFuICJ1c2lu
ZyBnYWRkciAwIiBpcyB2aW9sYXRpb24gb2Ygc3BlYz8gQnV0IEkgZG9uJ3Qgc2VlbSB0bwo+IGZp
bmQgaXQgd3JpdHRlbiBkb3duIGluIHRoZSBoZWFkZXIgZmlsZS4KCmEgZ2FkZHIgb2YgMCBpbmRp
Y2F0ZXMgbm8gbW9kbGlzdCAocGVyIHRoZSBnZW5lcmFsIHN0YXRlbWVudCBvZgphZGRyZXNzZXMg
YmVpbmcgemVybyksIGJ1dCBYZW4gd2lsbCB1c2UgdGhpcyBpZiBucl9tb2R1bGVzICE9IDAuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
