From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 14/14] xen/gnttab: Minor improvements to
 arch header files
Date: Wed, 30 Jan 2019 20:05:59 +0000
Message-ID: <1b41a9c2-baa4-7ce8-5437-b8e35edcc3eb@citrix.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-15-git-send-email-andrew.cooper3@citrix.com>
 <088e2270-4c01-c556-46d4-6d2dbfad1317@citrix.com>
 <55239c9d-ad0d-b9e7-3ca0-1c8e51bfd3ad@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <55239c9d-ad0d-b9e7-3ca0-1c8e51bfd3ad@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMjAxOSAyMDowNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDExLzIyLzE4IDU6NTYgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDIxLzExLzIw
MTggMTM6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiDCoCAqIFVzZSBYRlJFRSgpIHdoZW4g
YXBwcm9wcmlhdGUKPj4+IMKgICogRHJvcCBzdGFsZSBjb21tZW50cyBhbmQgdW5uZWNlc3Nhcnkg
YnJhY2tldHMKPj4+IMKgICogRm9sZCBhc20gY29uc3RyYWludHMKPj4+Cj4+PiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgo+Pj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+PiBDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+IMKgIHhl
bi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaCB8wqAgNiArKy0tLS0KPj4+IMKgIHhlbi9p
bmNsdWRlL2FzbS14ODYvZ3JhbnRfdGFibGUuaCB8IDEwICsrKy0tLS0tLS0KPj4KPj4gQ0MnaW5n
IEFSTSBtYWludGFpbmVycy7CoCBJJ20gc29ycnkgZm9yIG1pc3NpbmcgeW91IG91dCBvcmlnaW5h
bGx5IC0gSQo+PiBmb2xkZWQgdHdvIHNlcGFyYXRlIHBhdGNoZXMgYW5kIGZvcmdvdCB0byBhZGp1
c3QgdGhlIENDIGxpc3QuCj4KPiBTb3JyeSBpdCBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4KPgo+
IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKTm8gcHJvYmxl
bS7CoCBUaGFua3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
