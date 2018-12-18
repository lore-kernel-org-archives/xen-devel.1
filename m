From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v7 4/6] xen/arm: zynqmp: implement
 zynqmp_eemi
Date: Tue, 18 Dec 2018 16:02:21 +0000
Message-ID: <c57cd38f-5e0a-3174-4b58-226d929cc7c8@arm.com>
References: <alpine.DEB.2.10.1812171407210.15901@sstabellini-ThinkPad-X260>
 <1545084630-3873-4-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1545084630-3873-4-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <stefanos@xilinx.com>, saeed.nowshadi@xilinx.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEyLzE3LzE4IDEwOjEwIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gKyAgICAvKiBUaGVzZSBjYWxscyBhcmUgc2FmZSBhbmQgYWx3YXlzIGFsbG93ZWQuICAq
Lwo+ICsgICAgY2FzZSBFRU1JX0ZJRChaWU5RTVBfU0lQX1NWQ19DQUxMX0NPVU5UKToKPiArICAg
IGNhc2UgRUVNSV9GSUQoWllOUU1QX1NJUF9TVkNfVUlEKToKPiArICAgIGNhc2UgRUVNSV9GSUQo
WllOUU1QX1NJUF9TVkNfVkVSU0lPTik6CgpJIGFtIGEgYml0IHN1cnByaXNlZCB0aGF0IHlvdSBp
bXBsZW1lbnQgdGhvc2Ugb25lIHVzaW5nIFNNQzY0LiBXaHkgd291bGQgCnlvdSBkdXBsaWNhdGUg
dGhlIFNNQzMyIHZlcnNpb24gKEFSTV9TTUNDQ19DQUxMX0NPVU5UX0ZJRChTSVApKT8KCkkgYWxz
byBkb24ndCBzZWVtIHRvIGZpbmQgdGhlbSBuZWl0aGVyIGluIHRoZSBzcGVjIG5vciBpbiB0aGUg
QVRGIGNvZGUuCgpUaGUgcmVzdCBvZiB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
